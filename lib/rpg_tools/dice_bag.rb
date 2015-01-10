module RpgTools
  class DiceBag
    attr_accessor :base, :dices, :rolls, :set, :total

    def initialize(base)
      @base  = base
      @dices = set_bag_content(@base.gsub(/[dD].+/, '').to_i)
      @rolls = 0
      @set   = nil
      @total = 0
    end

    def roll
      @dices.each do |dice|
        dice.roll
      end

      @set =  [].tap do |response|
                @dices.each do |dice|
                  response << dice.value
                end
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
        dice_number.times do |dice|
          bag << Dice.new(@base.gsub(/^\d+/, ''))
        end
      end
    end
  end
end
