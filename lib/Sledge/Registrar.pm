package Sledge::Registrar;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Sledge::Exceptions;

sub context { Sledge::Exception::NoContextRunning->throw }

1;


