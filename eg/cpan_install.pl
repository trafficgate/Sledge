#!/usr/local/bin/perl
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use FindBin;
use CPAN;

$< == 0 or die <<DEATH;
You should be root to exectute me.
DEATH
    ;

my $handle = FileHandle->new("$FindBin::Bin/prereq-modules");
my @modules = map { chomp; (split / /)[0] } $handle->getlines;
install $_ for @modules;
