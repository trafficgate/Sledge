# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Test::More tests => 3;

package Mock::Pages;
use Sledge::Pages::Compat;

package main;
use CGI qw(-no_debug);
use IO::Scalar;

$ENV{HTTP_HOST} = 'localhost';
$ENV{REQUEST_URI} = '/foo';

my $page = bless {}, 'Mock::Pages';
$page->{r} = Sledge::Request::CGI->new(CGI->new);

my $out;
tie *STDOUT, 'IO::Scalar', \$out;
$page->redirect('foobar');
like $out, qr!Location: http://localhost/foobar!;
like $out, qr!Status: 302!;

$page->redirect('baz');
ok $out !~ /xxx/, $out;



