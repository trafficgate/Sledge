package Sledge;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use vars qw($VERSION $CODENAME);

$VERSION  = "1.10";
$CODENAME = "The Next Big Thing";

sub handler {
    my $r = shift;
    # Umm this doesn't work!
    Apache::add_version_component("Sledge/$VERSION ($CODENAME)");
}

1;
__END__

=head1 NAME

Sledge - Opensource Web Application Framework

=head1 AUTHORS

Tatsuhiko Miyagawa with many help from (listed in alphabetically):

  Akihiro Tsukui
  Atsushi Baba
  Eijiro Koike
  Hideoki Yoshikawa
  Hiroyuki Kobayashi
  Hiroyuki Oyama
  Kazuhiro Nakata
  Kensaku Fujiwara
  Makoto Hasegawa
  Masashi Seiki
  Naoto Ishikawa
  Shinya Hayakawa
  Shohei Tsunoda
  Takahiro Ohmori
  Takefumi Kimura
  Taro Sakamoto
  Tomohiro Ikebe
  Toyoo Kobayashi
  Yoshiharu Matsushima
  Yoshiki Kurihara

=cut
