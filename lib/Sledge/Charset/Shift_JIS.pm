package Sledge::Charset::Shift_JIS;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Charset);

use Jcode;

sub convert_param {
    my($self, $page) = @_;
    for my $p ($page->r->param) {
	my @v = map { Jcode->new($_, 'sjis')->h2z->euc } $page->r->param($p);
	$page->r->param($p => \@v);
    }
    return;
}

sub content_type {
    return 'text/html; charset=Shift_JIS';
}

sub output_filter {
    my($self, $content) = @_;
    return Jcode->new($content, 'euc')->sjis;
}

1;
