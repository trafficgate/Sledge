package Sledge::Charset::Null;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Charset);

sub convert_param {
    my($self, $page) = @_;
    return;
}

sub content_type {
    return 'text/html';
}

sub output_filter {
    my $self = shift;
    return @_;
}

1;
