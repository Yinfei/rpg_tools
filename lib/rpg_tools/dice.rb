module RpgTools
  class Dice
    attr_accessor :base, :sides, :value, :type, :rolls, :bonus, :malus

    def initialize(base)
      @base  = base.upcase
      @type  = fudge_dice? ? 'Fudge' : 'Standard'
      @value = nil
      @sides = fudge_dice? ? 3 : base.gsub(/^./, '').to_i
      @rolls = 0

      dice_validity_check
      set_modifiers_and_clean_base unless fudge_dice?
    end

    def roll
      @rolls += 1

      fudge_dice? ? fudge_roll : standard_roll
    end
    alias_method :roll!, :roll

    private

    def dice_validity_check
      sides_check
      base_check
    end

    def modifier_check
      if (@base =~ /^[D]\d+[+-]?\d*/).nil?
        raise ArgumentError.new("You can only use + or - as modifiers.")
      end
    end

    def base_check
      unless standard_dice? || fudge_dice?
        raise ArgumentError.new("You can only create strandard and fudge dices.")
      end
    end

    def sides_check
      if [0, 1].include?(@sides)
        raise ArgumentError.new("You can't create dices with less than 2 sides.")
      end
    end

    def set_modifiers_and_clean_base
      modifier_check

      @bonus = @base.gsub(/[D]\d+\+/, '').to_i
      @malus = @base.gsub(/[D]\d+\-/, '').to_i
      @base.gsub!(/[+-]\d+/ , '')
    end

    def fudge_roll
      @value = (rand(1..3) - 2)
    end

    def standard_roll
      @value = rand(1..@sides) + @bonus - @malus
    end

    def fudge_dice?
      @base == 'DF'
    end

    def standard_dice?
      @base.gsub(/^D\d*[+-]?[\d]+$/, '').empty?
    end
  end
end
