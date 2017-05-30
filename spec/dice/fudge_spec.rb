require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Fudge do
  let(:dice) { described_class.new }

  describe '#roll_calculation' do
    it 'rolls a value between -1 and 1' do
      10.times do
        dice.roll

        expect(dice.value.between?(-1, 1)).to be(true)
      end
    end
  end

  describe '#sides_count' do
    it 'returns 3' do
      expect(dice.send(:sides_count)).to eq(3)
    end
  end
end
