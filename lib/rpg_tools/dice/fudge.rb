module RpgTools
  module Dice
    class Fudge < Base
      def roll_calculation
        rand(-1..1)
      end

      private

      def sides_count
        3
      end
    end
  end
end
