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
      @dices.each { |dice| dice.roll }

      @set = @dices.each_with_object([]) do |dice, response|
               response << dice.value
             end

      @total = @set.inject{ |sum, x| sum + x }
      @set
    end

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
  end
end
