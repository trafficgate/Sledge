package Sledge::Constants;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Exporter);
@Sledge::Constants::EXPORT = qw(SUCCESS FAIL);

sub SUCCESS { 1 }
sub FAIL    { !SUCCESS }

1;
