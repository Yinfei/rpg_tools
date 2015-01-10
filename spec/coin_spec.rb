require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Coin do
  it "can't return anything else than 'Heads' or 'Tails'" do
    expect(['Heads', 'Tails'].include?(described_class.new.flip)).to eq(true)
  end
end
