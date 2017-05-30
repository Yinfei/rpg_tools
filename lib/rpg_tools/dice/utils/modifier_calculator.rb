module RpgTools
  module Dice
    module Utils
      class ModifierCalculator
        attr_accessor :total, :modifiers

        def initialize(total, modifiers)
          @total = total
          @modifiers = modifiers

          unprocessable_modifiers if malformed_modifiers?
        end

        def recalculate
          modifier_operations.each do |operator, value|
            eval("@total #{operator}= #{value}")
          end

          @total
        end

        private

        def modifier_operations
          @modifiers.scan(/(\D)(\d+)/)
        end

        def unprocessable_modifiers
          raise ArgumentError.new('Modifiers must be made of both an operator and a numeral value.')
        end

        def malformed_modifiers?
          no_operator_at_modifier_beginning? ||
            no_numeral_at_modifier_end? ||
            multiple_successive_operators?
        end

        def no_operator_at_modifier_beginning?
          @modifiers.match(/^\D/).nil?
        end

        def no_numeral_at_modifier_end?
          @modifiers.match(/\d+$/).nil?
        end

        def multiple_successive_operators?
          !@modifiers.match(/\d?([^0-9]{2,})\d?$/).nil?
        end
      end
    end
  end
end
