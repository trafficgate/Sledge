# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Test::More 'no_plan';

package Mock::Pages;
use base qw(Sledge::Pages::Base);

sub tmpl_dirname { 'baz' }
sub create_config { bless {}, 'Mock::Config' }

package Mock::Config;
sub tmpl_path { '/path/to/tmpl' }

package main;
my $page = bless {}, 'Mock::Pages';

my @tests = (
    'foo' => '/path/to/tmpl/baz/foo.html',
    '/foo' => '/path/to/tmpl/foo.html',
    'foo.txt' => '/path/to/tmpl/baz/foo.txt',
    '/foo.txt' => '/path/to/tmpl/foo.txt',
);

while (my($pagename, $path) = splice @tests, 0, 2) {
    is $page->guess_filename($pagename), $path;
}





