module RpgTools
  module Dice
    class Base
      attr_accessor :sides, :modifiers, :value, :rolls

      def initialize(sides = 0, modifiers = '')
        @sides = sides.zero? ? sides_count : sides
        @modifiers = modifiers
        @value = 0
        @rolls = 0

        check_sides
      end

      def roll
        @rolls += 1

        @value = perform_roll
      end

      private

      def perform_roll
        return roll_calculation if @modifiers.empty?

        roll_with_modifiers
      end

      def roll_with_modifiers
        Utils::ModifierCalculator.new(roll_calculation, @modifiers).recalculate
      end

      def roll_calculation
        raise NotImplementedError
      end

      def sides_count
        0
      end

      def check_sides
        if not_enough_sides
          raise ArgumentError, 'Your dice must have at least three sides.'
        end
      end

      def not_enough_sides
        @sides < 3
      end
    end
  end
end
