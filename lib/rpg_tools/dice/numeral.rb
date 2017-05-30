module RpgTools
  module Dice
    class Numeral < Base
      def roll_calculation
        rand(1..sides)
      end
    end
  end
end
