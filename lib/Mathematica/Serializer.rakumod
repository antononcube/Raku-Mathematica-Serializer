use Mathematica::Serializer::Encoder;

unit module Mathematica::Serializer;

#| Encoded Raku expressions to Wolfram Language (WL) expressions.
#| Currently only standard data structures are supported (lists, arrays, maps, hashes, Str, Numeric.)
#| C<$x> : Raku expression to encode.
#| C<:$encoded-head> : Should the encoded string have a special WL head or not?
multi encode-to-wl($x, :$encoded-head = True) is export {
    my $wlsObj = Mathematica::Serializer::Encoder.new();
    my $res = $wlsObj.to_wl($x);
    if $encoded-head { $res = 'WLEncoded[' ~ $res ~ ']' }
    return $res;
}