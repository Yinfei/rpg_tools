module RpgTools
  module Dice
    class Numerical < Base
      def roll_calculation
        rand(1..sides)
      end
    end
  end
end
