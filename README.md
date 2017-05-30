RpgTools [![Dependency Status](https://gemnasium.com/Yinfei/rpg_tools.svg)](https://gemnasium.com/Yinfei/rpg_tools) ![](https://circleci.com/gh/Yinfei/rpg_tools.svg?&style=shield&circle-token=f5153100f0a56438602b915cf95d80f1e6e0edca)
=======

A gem that gives you tools for your RPGs : dices, coins and playing cards !

## Usage

### Coins

`RpgTools::Coin.new`

* The `flip` method set its value to a "heads" or "tails" string.

### Dices

To a simple integer result, you can use the following Module method :
`RpgTools.roll_dice(arg)` <i>(`arg` is case insensitive)</i>.

* It can be a stardard dice like `"1dX"` for a X sided dice,
it also accepts miltiple chained modifiers like "+X", "-X" or "/X", to alter the roll result.

  `RpgTools.roll_dice("4d6+2")` will create 4 6-sided dices , roll them and add 2 to the
  sum of the roll result.

* It can be a fudge dice `"df"` : a three sided dice (-1, 0, +1).

* It can also be a percentile dice `"d%"` : a ten sided dice (from 10 to 100).

You can also manipulate all those dice types as objects :

* `RpgTools::Dice::Numeral`
* `RpgTools::Dice::Fudge`
* `RpgTools::Dice::Percentile`

All those classes respond to the `.roll` or `.roll!` methods to update their `value` to the result of the roll. Unfortunately, those classes don't handle modifiers at the moment.

### Dice Bags

`RpgTools::Dice::Bag.new(arg)` <i>(`arg` is case insensitive)</i>.

* You can only create dice bags the sam way you use the previous Module method.

  `RpgTools::DiceBag.new("4d6-2")` will create a bag of four 6 sided dices with a -2 modifier.

* The `value` attribute stores the sum of each dice result with the modifier applied.
* The `content` attribute stores an array of each dice object.
* The `modifiers` attribute keeps the whole modifiers applied to the sum of the rolls results.

### Playing card deck
`RpgTools::PlayingCardDeck.new(arg)` <i>(`arg` can only be 32 or 52)</i>.

* The `card` method returns a card of a 32 or 52 cards deck + 2 jokers, depending
of `arg` value.
* The `hand` method return an array of 5 `card` calls.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
