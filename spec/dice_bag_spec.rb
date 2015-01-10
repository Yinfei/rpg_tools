require 'rpg_tools'
require 'spec_helper'

describe RpgTools::DiceBag do
  it 'creates a bag with the right number of dices' do
    expect(described_class.new('4d6').dices.count).to eq(4)
  end

  it "doesn't roll the dices inside the bag at creation" do
    expect(described_class.new('2df').dices.first.value).to eq(nil)
  end

  it "doesn't create a bag with odd modifier dices" do
    expect { described_class.new('4d1%4') }.to raise_error(ArgumentError)
  end

  it "doesn't create empty bag" do
    expect { described_class.new('0D10') }.to raise_error(ArgumentError)
  end
end
