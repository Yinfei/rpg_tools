require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice::Bag do
  describe '#roll' do
    it "doesn't roll a dice without quantity" do
      expect { described_class.new('d10').roll }.to raise_error(ArgumentError)
    end

    it "doesn't roll a 'd0' dice" do
      expect { described_class.new('1d0').roll }.to raise_error(ArgumentError)
    end

    it "doesn't roll a 'd1' dice" do
      expect { described_class.new('1d1').roll }.to raise_error(ArgumentError)
    end

    it "doesn't roll a 'd2' dice" do
      expect { described_class.new('1d2').roll }.to raise_error(ArgumentError)
    end

    it 'rolls fudge dices' do
      expect { described_class.new('1df').roll }.not_to raise_error
    end

    it "rolls a dice may the 'd' char be capitalized or not" do
      expect { described_class.new('1d6').roll }.not_to raise_error
      expect { described_class.new('1D6').roll }.not_to raise_error
    end

    it "rolls a dice may the 'f' char be capitalized or not" do
      expect { described_class.new('1dF').roll }.not_to raise_error
      expect { described_class.new('1Df').roll }.not_to raise_error
    end

    it 'rolls a dice with a bonus' do
      expect { described_class.new('1d6+2').roll }.not_to raise_error
    end

    it 'rolls a dice with a malus' do
      expect { described_class.new('1D6-2').roll }.not_to raise_error
    end

    it 'rolls a dice with a multiple modifiers' do
      expect { described_class.new('1D6-2+4/8').roll }.not_to raise_error
    end

    it 'does not roll a dice with bad modifiers' do
      expect { described_class.new('1D6-+2').roll }.to raise_error(ArgumentError)
      expect { described_class.new('1D6-+2+').roll }.to raise_error(ArgumentError)
    end

    it "doesn't roll very odd dices" do
      expect { described_class.new('1dDOGE').roll }.to raise_error(ArgumentError)
      expect { described_class.new('1dfoo').roll }.to raise_error(ArgumentError)
      expect { described_class.new('1foobarbaz').roll }.to raise_error(ArgumentError)
    end
  end
end
