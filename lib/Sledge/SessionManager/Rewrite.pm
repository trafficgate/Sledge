package Sledge::SessionManager::Rewrite;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::SessionManager);

use vars qw($SessionIdName);
$SessionIdName  = 'sid';

# RewriteRule ^/sid=([^/]+)/(.*) /$2 [E=SESSIONID:$1]
sub get_session_id {
    my($self, $page) = @_;
    return $ENV{SESSIONID};
}

sub set_session_id {
    my($self, $page, $sid) = @_;
    unless ($page->r->uri =~ m@/$SessionIdName=.*/@) {
	$page->redirect($self->add_sid($page, $sid));
    }
}

sub add_sid {
    my($self, $page, $sid) = @_;
    return sprintf '/%s=%s%s', $SessionIdName, $sid, $page->r->uri;
}

1;
