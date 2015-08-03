module RpgTools
  class Dice
    attr_accessor :base, :sides, :value, :type, :rolls, :bonus, :malus

    def initialize(base)
      @base  = base.upcase
      @type  = (@base =~ /^.[F]$/).nil? ? 'Standard' : 'Fudge'
      @value = nil
      @sides = @type == 'Fudge' ? 3 : base.gsub(/^./, '').to_i
      @rolls = 0

      set_modifiers if standard_dice?
      base_check && modifier_check && sides_check
    end

    def roll
      @rolls += 1

      return fudge_roll if fudge_dice?

      standard_roll
    end

    private

    def modifier_check
      unless @base.gsub(/^[D]{1}[F]?\d+|[+-]\d+/, '').empty?
        raise ArgumentError.new("You can only use + or - as modifiers.")
      end
    end

    def base_check
      unless ['D', 'F'].include?(@base[0])
        raise ArgumentError.new("You can only create strandard and fudge dices.")
      end
    end

    def sides_check
      if [0, 1].include?(@sides)
        raise ArgumentError.new("You can't create dices with less than 2 sides.")
      end
    end

    def set_modifiers
      @bonus = (@base =~ /[D]\d+\+(\d+)/).nil? ? nil : @base.gsub(/[D]\d+\+/, '').to_i
      @malus = (@base =~ /[D]\d+\-(\d+)/).nil? ? nil : @base.gsub(/[D]\d+\-/, '').to_i
    end

    def fudge_roll
      @value = (rand(1..3) - 2)
    end

    def standard_roll
      @value = rand(1..@sides) + @bonus - @malus
    end

    def fudge_dice?
      @type == 'Fudge'
    end

    def standard_dice?
      @type == 'Standard'
    end
  end
end
