# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Co., Ltd..
#

use strict;
use Test::More 'no_plan';

use CGI;
use IO::Scalar;
use Sledge::Request::CGI;

{
    my $q = CGI->new({});
    my $r = Sledge::Request::CGI->new($q);

    $r->header_out(Foo => 'bar');
    my %headers = $r->headers_out;
    is_deeply \%headers, { Foo => 'bar' };
}

{
    my $q = CGI->new({});
    my $r = Sledge::Request::CGI->new($q);

    my $headers = $r->headers_out;
    $headers->{Foo} = 'bar';

    tie *STDOUT, 'IO::Scalar', \my $out;
    $r->send_http_header;
    untie *STDOUT;

    like $out, qr/Foo: bar/;
}

{
    my $q = CGI->new({});
    my $r = Sledge::Request::CGI->new($q);

    my $headers = $r->headers_out;
    $headers->add(Foo => 'bar');
    $headers->add(Foo => 'baz');

    tie *STDOUT, 'IO::Scalar', \my $out;
    $r->send_http_header;
    untie *STDOUT;

    like $out, qr/Foo: bar/;
    like $out, qr/Foo: baz/;
}

