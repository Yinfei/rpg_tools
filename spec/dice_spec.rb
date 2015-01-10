require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice do
  it "doesn't create a 'd0' dice" do
    expect { described_class.new('d0') }.to raise_error(ArgumentError)
  end

  it "doesn't create a 'd1' dice" do
    expect { described_class.new('d1') }.to raise_error(ArgumentError)
  end

  it 'creates fudge dices' do
    expect { described_class.new('df') }.not_to raise_error
  end

  it "creates a dice may the 'd' char be capitalized or not" do
    expect { described_class.new('d6') }.not_to raise_error
    expect { described_class.new('D6') }.not_to raise_error
  end

  it "creates a dice may the 'f' char be capitalized or not" do
    expect { described_class.new('dF') }.not_to raise_error
    expect { described_class.new('Df') }.not_to raise_error
  end

  it 'creates a dice with a bonus' do
    expect { described_class.new('d6+2') }.not_to raise_error
  end

  it 'creates a dice with a malus' do
    expect { described_class.new('D6-2') }.not_to raise_error
  end

  it "doesn't create a dice with an odd symbol" do
    expect { described_class.new('d6%2') }.to raise_error(ArgumentError)
  end
end
