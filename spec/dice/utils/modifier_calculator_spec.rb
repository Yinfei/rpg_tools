require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Utils::ModifierCalculator do
  let(:dice) { described_class.new(10, '+1') }

  describe '#initialize' do
    it 'raises an error for malformed modifiers' do
      expect { described_class.new(10, '+3+') }.to raise_error(ArgumentError)
    end

    it 'does not otherwise' do
      expect { described_class.new(10, '+5-3/10') }.not_to raise_error
    end
  end

  describe '#recalculate' do
    it 'applies a simple modifier to the total attribute' do
      dice = described_class.new(10, '+5')

      dice.recalculate

      expect(dice.total).to eq(15)
    end

    it 'applies multiple modifiers to the total attribute' do
      dice = described_class.new(10, '+5-1/2')

      dice.recalculate

      expect(dice.total).to eq(7)
    end
  end

  describe '#malformed_modifiers?' do
    it 'returns true if there is not operator at modifiers beginning' do
      dice.modifiers = '4'

      expect(dice.send(:malformed_modifiers?)).to be(true)
    end

    it 'returns true if there is no numeral at modifiers end' do
      dice.modifiers = '+3-'

      expect(dice.send(:malformed_modifiers?)).to be(true)
    end

    it 'returns true if multiple succesive operators are present in the modifiers' do
      dice.modifiers = '+-3'

      expect(dice.send(:malformed_modifiers?)).to be(true)
    end

    it 'returns false otherwise' do
      dice.modifiers = '+4-5/8'

      expect(dice.send(:malformed_modifiers?)).to be(false)
    end
  end

  describe '#no_operator_at_modifier_beginning?' do
    it 'returns true if there is not operator at modifiers beginning' do
      dice.modifiers = '4'

      expect(dice.send(:no_operator_at_modifier_beginning?)).to be(true)
    end

    it 'returs false otherwise' do
      expect(dice.send(:no_operator_at_modifier_beginning?)).to be(false)
    end
  end

  describe '#no_numeral_at_modifier_end?' do
    it 'returns true if there is no numeral at modifiers end' do
      dice.modifiers = '+3-'

      expect(dice.send(:no_numeral_at_modifier_end?)).to be(true)
    end

    it 'returs false otherwise' do
      expect(dice.send(:no_numeral_at_modifier_end?)).to be(false)
    end
  end

  describe '#multiple_successive_operators?' do
    it 'returns true if multiple succesive operators are present in the modifiers' do
    dice.modifiers = '+-3'

      expect(dice.send(:multiple_successive_operators?)).to be(true)
    end

    it 'returs false otherwise' do
      expect(dice.send(:multiple_successive_operators?)).to be(false)
    end
  end
end
