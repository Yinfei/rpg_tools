module RpgTools
  module Dice
    class Base
      attr_accessor :sides, :value, :rolls

      def initialize(sides = 0)
        @sides = sides.zero? ? sides_count : sides
        @value = 0
        @rolls = 0

        check_sides
      end

      def roll
        @rolls += 1

        @value = roll_calculation
      end

      private

      def roll_calculation
        raise NotImplementedError
      end

      def sides_count
        0
      end

      def check_sides
        raise ArgumentError.new('Your dice must have at least three sides.') if not_enough_sides
      end

      def not_enough_sides
        @sides < 3
      end
    end
  end
end
