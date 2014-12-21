require 'rpg_tools'
require 'spec_helper'

describe RpgTools::Card do
  it 'must return a card name' do
    expect(described_class.pick).not_to eq(true)
    expect(described_class.pick).not_to eq(false)
    expect(described_class.pick).not_to eq(nil)
  end
end
