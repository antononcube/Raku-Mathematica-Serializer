class Mathematica::Serializer::Encoder is export {

    #--------------------------------------------------------
    #| To WL format
    method to_wl(Any $obj --> Str) {
        given $obj {
            when Pair       { self.Pair-to-WL($_) }
            when Seq        { self.Positional-to-WL($_.Array) }
            when Positional { self.Positional-to-WL([|$obj]) }
            when Map        { self.Map-to-WL($obj) }
            when UInt       { self.UInt-to-WL($obj) }
            when Int        { self.Int-to-WL($obj) }
            when Rat        { self.Rat-to-WL($obj) }
            when Numeric    { self.Numeric-to-WL($obj) }
            when Str        { self.Str-to-WL($obj) }
            when $_.isa(Whatever) or $_.isa(WhateverCode) or $_.isa(HyperWhatever) { self.Whatever-to-WL() }
            when $_.isa(Any) {
                # Well _maybe_ it is Nil, hence NULL.
                self.Nil-to-WL()
            }
            default {
                die "Do not know how to serialize object of type { $_.WHAT }."
            }
        }
    }

    method Positional-to-WL(@p --> Str) {
        my $res = @p.map({ self.to_wl($_) }).join(',');
        return 'List[' ~ $res ~ ']'
    }

    method Map-to-WL(Map $m --> Str) {
        my $res = $m.pairs.map({ self.Pair-to-WL($_) }).join(',');
        return 'Association[' ~ $res ~ ']';
    }

    method Pair-to-WL(Pair $p --> Str) {
        my $k = self.to_wl($p.key);
        my $v = self.to_wl($p.value);
        return "Rule[$k,$v]"
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
        return 'Rational[' ~ $r.nude[0] ~ ',' ~ $r.nude[1] ~ ']'
    }

    method Whatever-to-WL() {
        return 'Automatic'
    }

    method Nil-to-WL() {
        return 'NULL'
    }
}