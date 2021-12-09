#!/usr/bin/env perl6

use lib './lib';
use lib '.';

use Mathematica::Serializer;
use Data::Generators;
use Data::Reshapers;

say encode-to-wl({ "a" => 23, "karma" => 'interest', "instance" => 1/3}):!encoded-head;

my $df = random-tabular-dataset(3,3);

say $df;
say encode-to-wl($df);

my $dfLong = to-long-format($df);
say $dfLong;
say $dfLong.WHAT;

say encode-to-wl($dfLong);
