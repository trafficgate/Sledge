package Sledge::Authorizer::Null;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Authorizer);

sub authorize {
    my($self, $page) = @_;
    return;
}

1;
