module RpgTools
  class Dice
    attr_accessor :base, :sides, :value, :type, :rolls, :bonus, :malus

    def initialize(base)
      @base  = base
      base_check
      @value = nil
      @type  = (@base =~ /^.[fF]$/).nil? ? 'Standard' : 'Fudge'
      @sides = @type == 'Fudge' ? 3 : base.gsub(/^./, '').to_i
      sides_check
      @rolls = 0
      set_modifiers if @type == 'Standard'
    end

    def roll
      return fudge_roll      if @type == 'Fudge'
      return standard_roll   if @bonus.nil? && @malus.nil?
      return roll_with_bonus if @malus.nil?
      return roll_with_malus if @bonus.nil?
    end

    private

    def modifier_check
      unless @base.gsub(/^[dD]{1}[fF]?\d+|[+-]\d+/, '').empty?
        raise ArgumentError.new("You can only use + or - as modifiers.")
      end
    end

    def set_modifiers
      modifier_check
      @bonus = (@base =~ /[Dd]\d+\+(\d+)/).nil? ? nil : @base.gsub(/[Dd]\d+\+/, '').to_i
      @malus = (@base =~ /[Dd]\d+\-(\d+)/).nil? ? nil : @base.gsub(/[Dd]\d+\-/, '').to_i
    end

    def base_check
      unless ['d', 'D', 'f', 'F'].include?(@base[0])
        raise ArgumentError.new("You can only create strandard and fudge dices.")
      end
    end

    def sides_check
      if [0, 1].include?(@sides)
        raise ArgumentError.new("You can't create dices with less than 2 sides.")
      end
    end

    def fudge_roll
      @rolls += 1
      @value = (rand(1..3) - 2)
    end

    def standard_roll
      @rolls += 1
      @value = rand(1..@sides)
    end

    def roll_with_bonus
      @rolls += 1
      @value = rand(1..@sides) + @bonus
    end

    def roll_with_malus
      @rolls += 1
      @value = rand(1..@sides) - @malus
    end
  end
end
