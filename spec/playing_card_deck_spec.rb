require 'rpg_tools'
require 'spec_helper'

describe RpgTools::PlayingCardDeck do
  it 'must return a card name' do
    expect(described_class.new(32).card).not_to eq(true)
    expect(described_class.new(32).card).not_to eq(false)
    expect(described_class.new(32).card).not_to eq(nil)
    expect(described_class.new(52).card).not_to eq(true)
    expect(described_class.new(52).card).not_to eq(false)
    expect(described_class.new(52).card).not_to eq(nil)
  end

  it 'must return 5 cards for a full hand' do
    expect(described_class.new(32).hand.count).to eq(5)
    expect(described_class.new(52).hand.count).to eq(5)
  end

  it "can't pick the same card twice" do
    expect(described_class.new(32).hand.uniq.count).to eq(5)
    expect(described_class.new(52).hand.uniq.count).to eq(5)
  end

  it "can't use anything else than a 32 or 52 cards deck" do
    expect { described_class.new(42) }.to raise_error(ArgumentError)
    expect { described_class.new(666) }.to raise_error(ArgumentError)
  end
end
