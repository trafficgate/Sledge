# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Test::More tests => 1;

use CGI qw(-no_debug);

package Mock::Pages;
use Sledge::Pages::Compat;

sub send_http_header {
    die 'send_http override';
}

package main;

$ENV{HTTP_HOST} = 'localhost';
$ENV{REQUEST_URI} = '/foo';

my $p = bless {}, 'Mock::Pages';
$p->{r} = Sledge::Request::CGI->new(CGI->new);

eval {
    $p->redirect('bar');
    fail 'no exception';
};

like $@, qr/send_http override/;

