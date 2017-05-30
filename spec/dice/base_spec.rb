require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Base do
  let(:dice) { described_class.new(10) }

  describe '#initialize' do
    it 'creates a basic dice' do
      expect { described_class.new(10) }.not_to raise_error
    end

    it 'falls back on sides_count method if no sides arg is provided' do
      allow_any_instance_of(described_class).to receive(:sides_count).and_return(7)

      new_dice = described_class.new

      expect(new_dice.sides).to eq(7)
    end
  end

  describe '#roll' do
    before do
      allow(dice).to receive(:roll_calculation).and_return(10)
    end

    it 'returns an integer based on a roll_calculation method' do
      expect(dice.roll).to eq(10)
    end

    it 'updates a dice value attribute' do
      dice.roll

      expect(dice.value).to eq(10)
    end

    it 'increments to dice roll count' do
      dice.roll

      expect(dice.rolls).to eq(1)

      dice.roll

      expect(dice.rolls).to eq(2)
    end
  end

  describe '#sides_count' do
    it 'returns zero' do
      expect(dice.send(:sides_count)).to eq(0)
    end
  end

  describe '#roll_calculation' do
    it 'raises a NotImplementedError' do
      expect { dice.send(:roll_calculation) }.to raise_error(NotImplementedError)
    end
  end

  describe 'not_enough_sides' do
    it 'returns true if dice sides is less than three' do
      dice.sides = 2

      expect(dice.send(:not_enough_sides)).to be(true)
    end

    it 'returns false otherwise' do
      expect(dice.send(:not_enough_sides)).to be(false)
    end
  end
end
