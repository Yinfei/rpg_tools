module RpgTools
  module Dice
    class Percentile < Base
      def roll_calculation
        (rand(1..10) * 10)
      end

      private

      def sides_count
        10
      end
    end
  end
end
