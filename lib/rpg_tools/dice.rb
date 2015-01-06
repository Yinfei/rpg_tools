module RpgTools
  class Dice
    class << self
      def roll(dice)
        dices = dice.split(/d/i).first.to_i
        max_value = dice.split(/d/i).last.to_i

        # I mean, seriously ?
        return true if dices.zero?

        # We don't roll d0 and d1 for obvious reasons.
        return true if [0, 1].include?(max_value)

        # We do a normal roll if no bonus/malus is set on the dice
        return standard_roll(dices, max_value) if dice =~ /^\d+[Dd]\d+$/

        # We apply bonuses/maluses properly if any
        if dice =~ /^\d+[Dd]\d+(\+)(\d+)/
          bonus = dice.gsub(/^\d+[Dd]\d+(\+)/, '').to_i
          roll_with_bonus(dices, max_value, bonus)
        elsif dice =~ /^\d+[Dd]\d+(\-)(\d+)/
          malus = dice.gsub(/^\d+[Dd]\d+(\-)/, '').to_i
          roll_with_malus(dices, max_value, malus)
        else
          true
        end
      end

      def standard_roll(dices, max_value)
        [].tap do |dice_set|
          dices.times do
            dice_set << rand(1..max_value)
          end
        end
      end

      def roll_with_bonus(dices, max_value, bonus)
        [].tap do |dice_set|
          dices.times do
            dice_set << (rand(1..max_value) + bonus)
          end
        end
      end

      def roll_with_malus(dices, max_value, malus)
        [].tap do |dice_set|
          dices.times do
            dice_set << (rand(1..max_value) - malus)
          end
        end
      end
    end
  end
end
