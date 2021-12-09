class Mathematica::Serializer::Encoder is export {

    #--------------------------------------------------------
    #| To WL format
    method to_wl( Any $obj --> Str) {
        if $obj ~~ Positional {
            return self.Positional-to-WL($obj)
        } elsif $obj ~~ Map {
            return self.Map-to-WL($obj)
        } elsif $obj ~~ Pair {
            return self.Pair-to-WL($obj)
        } elsif $obj ~~ Int {
            return self.Int-to-WL($obj)
        } elsif $obj ~~ UInt {
            return self.UInt-to-WL($obj)
        } elsif $obj ~~ Rat {
            return self.Rat-to-WL($obj)
        } elsif $obj ~~ Numeric {
            return self.Numeric-to-WL($obj)
        } elsif $obj ~~ Str {
            return self.Str-to-WL($obj)
        } else {
            die "Do not know how to serialize object."
        }
    }

    method Positional-to-WL(@p --> Str) {
        my $res = '';
        for @p -> $x {
            $res ~= ($res ?? ',' !! '') ~ self.to_wl($x)
        }
        return 'List[' ~ $res ~ ']'
    }

    method Map-to-WL(Map $m --> Str) {
        my $res = '';
        for $m.pairs -> $p {
            $res ~= ($res ?? ',' !! '') ~ self.Pair-to-WL($p)
        }
        return 'Association[' ~ $res ~ ']';
    }

    method Pair-to-WL(Pair $p --> Str) {
        my $k = self.to_wl($p.key);
        my $v = self.to_wl($p.value);
        return 'Rule[' ~ $k ~ ',' ~ $v ~ ']'
    }

    method Int-to-WL(Int $i --> Str) {
        return $i.Str
    }

    method UInt-to-WL(UInt $i --> Str) {
        return $i.Str
    }

    method Numeric-to-WL(Numeric $n --> Str) {
        return $n.Str
    }

    method Str-to-WL(Str $s --> Str) {
        return '"' ~ $s ~ '"'
    }

    method Rat-to-WL(Rat $r --> Str) {
        return 'Rational['~ $r.nude[0] ~ ',' ~ $r.nude[1] ~ ']'
    }
}