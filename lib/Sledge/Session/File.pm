package Sledge::Session::File;
# $Id$
#
# IKEBE Tomohiro <ikebe@livedoor.jp>
# Livedoor, Co.,Ltd.
#

use strict;
use base qw(Sledge::Session);

use FileHandle;
use File::Spec;
use Fcntl qw(:flock);
use Sledge::Exceptions;

sub _connect_database    { 
    my($self, $page) = @_;
    my $config = $page->create_config;
    my $dir = eval { $config->session_dir } || '/tmp';
    # for session cleanup plugin
    return $dir unless ref $self;
    my $file = sprintf '%s/Sledge-Session-%s', $dir, $self->{_sid};
    $self->{__filename} = $file;
    my $fh = FileHandle->new($file, O_RDWR|O_CREAT) 
	or Sledge::Exception::DBConnectionError->throw($!);
    return $fh;
}

sub _select_me { 
    my($self, $opt) = @_;
    my $fh = $self->{_dbh};
    flock($fh, LOCK_SH);
    $fh->seek(0, 0);
    my $data;
    while (<$fh>) {
	$data .= $_;
    }
    flock($fh, LOCK_UN);
    $self->{_data} = $self->_deserialize($data);
}

sub _insert_me {
    my $self = shift;
    my $fh = $self->{_dbh};
    flock($fh, LOCK_EX);
    $fh->truncate(0);
    $fh->seek(0, 0);
    $fh->print($self->_serialize($self->{_data}));
    flock($fh, LOCK_UN);
}

sub _update_me { shift->_insert_me; }
sub _delete_me { unlink shift->{__filename}; }

sub _commit {
    my $self = shift;
    $self->{_dbh}->close if $self->{_dbh};
}
sub _do_lock {}
sub _lockid {}
sub _do_cleanup { 
    my($self, $dir, $min) = @_;
    # XXX insecure?
    unlink $_ for
	grep { _mtime($_) < time - $min * 60 } glob "$dir/Sledge-Session-*";
}

sub _mtime { (stat(shift))[9] }


1;

__END__
