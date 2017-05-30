require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Percentile do
  let(:dice) { described_class.new }

  describe '#roll_calculation' do
    it 'rolls a value between 10 and 100' do
      10.times do
        dice.roll

        expect(dice.value.between?(10, 100)).to be(true)
      end
    end

    it 'rolls only round values' do
      10.times do
        dice.roll

        expect(dice.value[-1]).to eq(0)
      end
    end
  end

  describe '#sides_count' do
    it 'returns 10' do
      expect(dice.send(:sides_count)).to eq(10)
    end
  end
end
