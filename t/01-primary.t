#!/usr/bin/perl
use strict;
use warnings;


use Data::Dumper qw(Dumper);
use Test::More;
my $tests;
plan tests => $tests;

use_ok('Parse::Fedora::Packages');

my $p = Parse::Fedora::Packages->new;
isa_ok($p, 'Parse::Fedora::Packages');
BEGIN { $tests += 2; }

$p->parse_primary('t/files/primary.xml');
diag $p->count_packages;
is($p->reported_count_packages, 4, "number of packages is correct");
is($p->count_packages, 4, "number of packages is correct");
BEGIN { $tests += 2; }

{
    my @all = $p->list_packages();
    my $expected = [
    {
        name    => 'esc',
        version => '1.0.0',
    },
    {
        name    =>  'netpbm-devel',
        version => '10.35',
    },
    {
        name    => 'perl-IO-Socket-INET6',
        version => '2.51',
    },
    {
        name    => 'kdeutils',
        version => '3.5.4',
    }
    ];
    is_deeply(\@all, $expected);
    BEGIN { $tests += 1; }
}

{
    my @all = $p->list_packages(name => 'perl');
    my $expected = [
    {
        name    => 'perl-IO-Socket-INET6',
        version => '2.51',
    },
    ];
    is_deeply(\@all, $expected);
    BEGIN { $tests += 1; }
}




