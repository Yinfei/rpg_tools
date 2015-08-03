module RpgTools
  class DiceBag
    attr_accessor :base, :dices, :rolls, :set, :total

    def initialize(base)
      @base  = base.upcase
      @dices = set_bag_content(@base.gsub(/[D].+/, '').to_i)
      @rolls = 0
      @set   = []
      @total = 0
    end

    def roll
      @set = roll_dices_set
      calculate_total_and_show_set
    end
    alias_method :roll!, :roll

    private

    def empty_bag_check(dice_number)
      if dice_number.zero?
        raise ArgumentError.new("You can't create an empty bag.")
      end
    end

    def set_bag_content(dice_number)
      empty_bag_check(dice_number)

      [].tap do |bag|
        dice_number.times do
          bag << Dice.new(@base.gsub(/^\d+/, ''))
        end
      end
    end

    def roll_dices_set
      @dices.each do |dice|
        dice.roll
      end

      @dices.each_with_object([]) do |dice, response|
        response << dice.value
      end
    end

    def calculate_total_and_show_set
      @total = @set.inject{ |sum, x| sum + x }
      @set
    end
  end
end
