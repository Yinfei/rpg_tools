require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Utils::Parser do
  describe '#initialize' do
    it 'raises an error when no matching pattern is found' do
      expect { described_class.new('DOGE') }.to raise_error(ArgumentError)
    end

    it 'does not otherwise' do
      expect { described_class.new('1DF') }.not_to raise_error
      expect { described_class.new('1D10') }.not_to raise_error
      expect { described_class.new('1D10+12') }.not_to raise_error
      expect { described_class.new('1D%') }.not_to raise_error
    end
  end

  describe '#handle' do
    it 'builds a hash based on a mathcing pattern' do
      hash = described_class.new('3DF+4').handle

      expect(hash[:quantity]).to eq(3)
      expect(hash[:type]).to eq('DF')
      expect(hash[:sides]).to eq(0)
      expect(hash[:modifiers]).to eq('+4')
    end
  end
end
