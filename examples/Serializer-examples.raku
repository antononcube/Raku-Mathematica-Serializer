#!/usr/bin/env perl6

use lib './lib';
use lib '.';

use Mathematica::Serializer;
use Data::Generators;

say encode-to-wl({ "a" => 23, "karma" => 'interest', "instance" => 1/3});

my $df = random-tabular-dataset(3,3);

say $df;
say encode-to-wl($df);
