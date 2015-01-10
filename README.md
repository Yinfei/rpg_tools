RpgTools [![Dependency Status](https://gemnasium.com/Yinfei/rpg_tools.svg)](https://gemnasium.com/Yinfei/rpg_tools)
=======

A gem that gives you tools for your RPGs : dices, coins and playing cards !

## Usage

### Coins

`RpgTools::Coin.new`

* The `flip` method set its value to a "heads" or "tails" string.

### Dices

`RpgTools::Coin.new(arg)` <i>(`arg` is case insensitive)</i>.

* It can be a stardard dice like `"dX"` for a X sided dice,
it also accepts modifiers like '+X' or '-X' to alter the roll result.

  `RpgTools::Dice.new("d6+2")` will create a 6 sided dice that adds 2 to each
  roll result.

* It can also be a fudge dice `"df"` : a three sided dice (-1, 0, +1).

* The `roll` method rolls it and set its value according to the result.

### Dice Bags

`RpgTools::DiceBag.new(arg)` <i>(`arg` is case insensitive)</i>.

* You can only create standard dice and fudge dice bags.

  `RpgTools::DiceBag.new("4d6-2)` will create a bag of four 6 sided dices with a -2 modifier.

* The `roll` method rolls each dice of the bag.
* The `total` attribute stores the sum of each dice result.
* The `set` attribute stores an array of each dice result.

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
