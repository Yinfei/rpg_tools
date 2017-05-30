module RpgTools
  module Dice
    class Bag
      attr_accessor :dice_hash, :content, :modifiers, :value

      def initialize(base)
        @dice_hash = Utils::Parser.new(base).handle
        @content = []
        @modifiers = dice_hash[:modifiers]
        @value = 0
      end

      def roll
        invalid_dice! if dice_klass.nil?

        fill_bag!

        roll_bag_content!

        return @total if modifiers.empty?

        @total = Utils::ModifierCalculator.new(@total, modifiers).recalculate
      end
      alias_method :roll!, :roll

      private

      def fill_bag!
        quantity.times { @content << dice_klass.new(sides) }
      end

      def roll_bag_content!
        @content.map(&:roll)

        @total = @content.map(&:value).inject(0, :+)
      end

      def dice_klass
        dice_notations[type]
      end

      def dice_notations
        {
          'D'  => Numeral,
          'D%' => Percentile,
          'DF' => Fudge
        }
      end

      def type
        dice_hash[:type]
      end

      def sides
        dice_hash[:sides]
      end


      def quantity
        dice_hash[:quantity]
      end

      def invalid_dice!
        raise ArgumentError.new('Unsupported dice type.')
      end
    end
  end
end
