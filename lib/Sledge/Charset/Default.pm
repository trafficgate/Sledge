package Sledge::Charset::Default;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Charset::Null);

sub content_type {
    return 'text/html; charset=euc-jp';
}

1;
