package Sledge::Pages::CGI;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Pages::Base);

use CGI;
use Sledge::Request::CGI;

sub create_request {
    my($self, $query) = @_;
    return Sledge::Request::CGI->new($query || CGI->new);
}

1;

