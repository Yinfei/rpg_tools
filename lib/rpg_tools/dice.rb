module RpgTools
  class Dice
    class << self
      def roll(arg)
        dices_num = arg.split(/d/i).first.to_i
        max_value = arg.split(/d/i).last.to_i

        # I mean, seriously ?
        return true if dices_num.zero?

        # We don't roll d0 and d1 for obvious reasons.
        return true if [0, 1].include?(max_value)

        [].tap do |dice_set|
          dices_num.times do
            dice_set << rand(1..max_value)
          end
        end
      end
    end
  end
end
