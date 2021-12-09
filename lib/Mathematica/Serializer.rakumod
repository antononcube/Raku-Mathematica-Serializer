use Mathematica::Serializer::Encoder;

unit module Mathematica::Serializer;

sub encode-to-wl($x, :$encoded-head = True) is export {
    my $wlsObj = Mathematica::Serializer::Encoder.new();
    my $res = $wlsObj.to_wl($x);
    if $encoded-head { $res = 'WLEncoded[' ~ $res ~ ']' }
    return $res;
}