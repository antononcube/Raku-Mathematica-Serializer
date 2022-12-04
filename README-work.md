# Raku-Mathematica-Serializer

Raku package for serialization of Raku objects and expressions to Mathematica expressions.

**Remark:** Mathematica is also known as Wolfram Language (WL). Mathematica and WL are used as synonyms below.

## Usage examples

Here we convert an array of pairs into a WL expression.
```perl6
use Mathematica::Serializer;
encode-to-wl([ "a" => 23, "karma" => 'interest', "instance" => 1/3, "ary" => Whatever, "condo" => Nil]):!encoded-head;
```

Here is a list of date-time objects:

```perl6
my @dts = (DateTime.new(2022,1,1,2,9,0), DateTime.new(2022,1,1,11,35,0), DateTime.new(2022,1,1,11,36,0)).Seq;
```

Here we convert that list into a Mathematica expression:

```perl6
@dts ==> encode-to-wl
```

-------

## References

### Articles

[AA1] Anton Antonov,
["Connecting Mathematica and Raku"](https://rakuforprediction.wordpress.com/2021/12/30/connecting-mathematica-and-raku/),
(2021),
[RakuForPrediction at WordPress]([https://rakuforprediction.wordpress.com/).

### Packages

[AAp1] Anton Antonov
[Text::CodeProcessing Raku package](https://github.com/antononcube/Raku-Text-CodeProcessing),
(2021-2022),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov
[Mathematica-Grammar Raku package](https://github.com/antononcube/Raku-Mathematica-Grammar),
(2021-2022),
[GitHub/antononcube](https://github.com/antononcube).

[AAp3] Anton Antonov,
[RakuMode Mathematica package](https://github.com/antononcube/ConversationalAgents/blob/master/Packages/WL/RakuMode.m),
(2020-2021),
[ConversationalAgents at GitHub/antononcube](https://github.com/antononcube/ConversationalAgents).

