package Sledge::Session::MySQL;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use base qw(Sledge::Session::DBI);

sub connect_attr {
    return {
	PrintError => 1, RaiseError => 1, AutoCommit => 1,
    };
}

sub _do_lock {
    my $self = shift;
    $self->{_lock} = sub {
	my $self = shift;
	my $sth = $self->_prepare('SELECT RELEASE_LOCK(?)');
	$sth->execute($self->_lockid);
	$sth->finish;
    };
    my $sth = $self->_prepare('SELECT GET_LOCK(?, 300)');
    $sth->execute($self->_lockid);
    $sth->finish;
}

sub _lockid {
    my $self = shift;
    return 'Apache-Session-' . $self->{_sid};
}

sub _do_cleanup {
    my($self, $dbh, $min) = @_;
    my $sth = $dbh->prepare(<<SQL);
DELETE FROM sessions
WHERE timestamp < SUBDATE(NOW(), INTERVAL ? MINUTE)
SQL
    ;
    $sth->execute($min);
    $sth->finish;
}

1;
