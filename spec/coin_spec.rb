require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Coin do
  it "can't return anything else than 'heads' or 'tails'" do
    expect(['heads', 'tails'].include?(described_class.flip)).to eq(true)
  end
end
