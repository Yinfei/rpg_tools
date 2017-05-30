require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Numeral do
  let(:dice) { described_class.new(10) }

  describe '#roll_calculation' do
    it 'rolls a value between 1 and the sides value' do
      10.times do
        dice.roll

        expect(dice.value.between?(1, dice.sides)).to be(true)
      end
    end
  end
end
