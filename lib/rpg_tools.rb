require 'rpg_tools/coin'
require 'rpg_tools/dice'
require 'rpg_tools/playing_card_deck'

module RpgTools
  def roll_dice(dice)
    Dice::Bag.new(dice).roll
  end
end
