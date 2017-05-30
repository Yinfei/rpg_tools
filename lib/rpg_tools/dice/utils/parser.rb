module RpgTools
  module Dice
    module Utils
      class Parser
        attr_reader :dice

        def initialize(dice)
          @dice = dice.upcase.match(/^(\d+)([A-Z%]+)(\d*)(.*)$/)

          quantity_error! if @dice.nil?
        end

        def handle
          {
            quantity: quantity,
            type: type,
            sides: sides,
            modifiers: modifiers
          }
        end

        private

        def quantity
          @dice[1].to_i
        end

        def type
          @dice[2]
        end

        def sides
          @dice[3].to_i
        end

        def modifiers
          @dice[4]
        end

        def quantity_error!
          raise ArgumentError.new('You must specify a dice quantity.')
        end
      end
    end
  end
end
