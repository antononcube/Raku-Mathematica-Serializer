#!/usr/bin/env perl6

use Mathematica::Serializer;
use Data::ExampleDatasets;

my $tstart = now;
my @metadata = get-datasets-metadata();
my $tend = now;
say "Ingest time {$tend - $tstart}";

$tstart = now;
my $sres = encode-to-wl(@metadata);
$tend = now;
say "Encode time {$tend - $tstart}";