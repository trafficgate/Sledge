# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Test::More 'no_plan';

use Sledge::Pages::Base;

my $ld = bless {}, 'Sledge::Pages::Base';
$ld->_destroy_me;

isa_ok $ld, 'Sledge::Pages::LivingDead';
$ld->foo;
$ld->bar;

pass 'everything is into the hole!';
