package Sledge::Pages::Apache;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Pages::Base);

use Apache;
use Apache::Request;

sub create_request {
    my($self, $r) = @_;
    my $req = Apache::Request->new($r || Apache->request);
    $req->param;		# do parse here
    return $req;
}

1;
