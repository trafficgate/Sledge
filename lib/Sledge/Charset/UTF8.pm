package Sledge::Charset::UTF8;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Charset::Null);

use Encode::compat; # for 5.6
use Encode;

sub convert_param {
    my($self, $page) = @_;
    for my $p ($page->r->param) {
	my @v = map decode("UTF-8", $_), $page->r->param($p);
	$page->r->param($p => \@v);
    }
    return;
}

sub content_type {
    return 'text/html; charset=UTF-8';
}

sub output_filter {
    my($self, $content) = @_;
    return encode("UTF-8", $content);
}

1;
