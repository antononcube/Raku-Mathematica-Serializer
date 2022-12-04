use v6.d;
use Test;

use lib '.';
use lib './lib';

use Mathematica::Serializer;

plan 3;

## 1
my $expr1 = [ "a" => 23, 'b' => 'corr', "karma" => <interest change>, "instance" => 1/3, "ary" => Whatever, "condo" => Nil];
my $res1 = 'List[Rule["a",23],Rule["b","corr"],Rule["karma",List["interest","change"]],Rule["instance",Rational[1,3]],Rule["ary",Automatic],Rule["condo",NULL]]';

is encode-to-wl($expr1), 'WLEncoded[' ~ $res1 ~ ']';

## 2
my $expr2 = %(a => 'use dataset VAR_NAME("sCwvu")');
my $res2 = 'Association[Rule["a","use dataset VAR_NAME(\"sCwvu\")"]]';

is encode-to-wl($expr2), 'WLEncoded[' ~ $res2 ~ ']';

## 3
my $expr3 = (DateTime.new(2022,1,1,2,9,0), DateTime.new(2022,1,1,11,35,0), DateTime.new(2022,1,1,11,36,0)).Seq;
my $res3 = 'List[DateObject[{2022,1,1,2,9,0}],DateObject[{2022,1,1,11,35,0}],DateObject[{2022,1,1,11,36,0}]]';

is encode-to-wl($expr3), 'WLEncoded[' ~ $res3 ~ ']';

done-testing;
