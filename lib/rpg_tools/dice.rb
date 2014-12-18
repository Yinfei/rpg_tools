module RpgTools
  class Dice
    class << self
      def roll(arg)
        dices_num = arg.split(/d/i).first.to_i
        max_value = arg.split(/d/i).last.to_i
        max_value + 1 if max_value < 2

        # I mean, seriously ?
        return nil if dices_num.zero?

        [].tap do |dice_set|
          dices_num.times do
            dice_set << rand(1..max_value)
          end
        end
      end
    end
  end
end
