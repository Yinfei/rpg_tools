module RpgTools
  class Card
    def self.pick
      joker_pick_check == true ? 'Joker' : standard_card
    end

    def self.joker_pick_check
      [0, 1].include?((0..54).to_a.sample(1).first)
    end

    def self.standard_card
      number = [(1..10).to_a, 'Jack', 'Queen', 'King'].flatten.sample(1)
      color  = ['clubs', 'hearts', 'diamonds', 'spades'].sample(1)
      [number, color].join(' of ')
    end
  end
end
