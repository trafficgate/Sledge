# $Id$

use strict;
use Test::More 'no_plan';

package Test::Pages;
use Sledge::Pages::Compat;

package main;
{
    my $page = bless {}, 'Test::Pages';
    isa_ok $page, 'Sledge::Pages::CGI';
}
