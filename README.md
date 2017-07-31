rpg_tools [![Dependency Status](https://gemnasium.com/Yinfei/rpg_tools.svg)](https://gemnasium.com/Yinfei/rpg_tools) ![](https://circleci.com/gh/Yinfei/rpg_tools.svg?&style=shield&circle-token=f5153100f0a56438602b915cf95d80f1e6e0edca)
=======

A gem that gives you tools for your RPGs : dices, coins and playing cards !

## Usage

### Coins

`RpgTools::Coin.new`

* The `flip` method set its value to a `heads` or `tails` string.

### Dices

`RpgTools.roll_dice(arg)` <i>(`arg` is case insensitive)</i>.

This returns a plain integer result based on the `arg` parameter.

* It can be a stardard dice like `"1dX"` for a X sided dice.

* It can be a fudge dice `"df"` : a three sided dice (-1, 0, +1).

* It can also be a percentile dice `"d%"` : a ten sided dice (from 10 to 100).

You can also add multiple chained modifiers like "+X", "-X", "*X" or "/X", to alter the roll result. `RpgTools.roll_dice("4d6+2")` will create 4 6-sided dices, roll them and add 2 to the sum of the roll result.

You can also manipulate all those dice types as objects :

* `RpgTools::Dice::Numerical`
* `RpgTools::Dice::Fudge`
* `RpgTools::Dice::Percentile`

All those classes take two args: a mandatory side number and an optional modifier.
They respond to the `.roll` or `.roll!` methods to update their `value` to the result of the roll.

`RpgTools::Dice::Numerical.new(6, '+4').roll` will roll a six sided dice and add 4 to the roll result.

### Dice Bags

`RpgTools::Dice::Bag.new(arg)` <i>(`arg` is case insensitive)</i>.

* It works the same way `RpgTools.roll_dice` does but will give you a `RpgTools::Dice::Bag` object instead of a plain integer. `RpgTools::Dice::Bag.new("4d6-2")` will create a bag of four 6 sided dices with a -2 modifier to the sum of all rolls.

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
