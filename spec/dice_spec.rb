require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Dice do
  it "doesn't roll a '0d' dice" do
    expect(described_class.roll('0d6')).to eq(true)
  end

  it "doesn't roll a 'd0' dice" do
    expect(described_class.roll('1d0')).to eq(true)
  end

  it "doesn't roll a 'd1' dice" do
    expect(described_class.roll('1d1')).to eq(true)
  end

  it 'returns the right number of dices' do
    expect(described_class.roll('2d6').count).to eq(2)
  end

  it "rolls a dice may the 'd' char be capitalized or not" do
    expect(described_class.roll('1d6').count).to eq(1)
    expect(described_class.roll('1D6').count).to eq(1)
  end
end
