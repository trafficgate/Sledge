package Sledge::Authorizer;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Class::Accessor);

use Sledge::Exceptions;

sub new {
    my($class, $page) = @_;
    bless {}, $class;
}

sub authorize { Sledge::Exception::AbstractMethod->throw }

1;
