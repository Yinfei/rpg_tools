RpgTools [![Dependency Status](https://gemnasium.com/Yinfei/rpg_tools.svg)](https://gemnasium.com/Yinfei/rpg_tools)
=======

A gem that gives you tools for your RPGs : dices, coins, cards !

## Usage

* <tt>RpgTools::Coin.flip</tt> returns a "heads" or "tails" string.
* <tt>RpgTools::Dice.roll(arg)</tt> returns an array of dices of your choice (arg format : "1d6", "4D10", "1d6+3" or "4D6-1" for example).
* <tt>RpgTools::Card.pick</tt> returns a card of a 52 cards deck + 2 jokers.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
