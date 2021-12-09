use Mathematica::Serializer::Encoder;

unit module Mathematica::Serializer;

sub encode-to-wl($x) is export {
    my $wlsObj = Mathematica::Serializer::Encoder.new();
    return $wlsObj.to_wl($x);
}