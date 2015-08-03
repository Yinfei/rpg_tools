module RpgTools
  class Coin
    attr_accessor :value, :flips, :heads, :tails

    def initialize
      @value, @flips, @heads, @tails = nil, 0, 0, 0
    end

    def flip
      @flips += 1
      @value = rand(2) == 1 ? 'Heads' : 'Tails'
      save_result
      @value
    end
    alias_method :flip!, :flip

    private

    def save_result
      @heads += 1 if heads?
      @tails += 1 if tails?
    end

    def heads?
      @value == 'Heads'
    end

    def tails?
      @value == 'Tails'
    end
  end
end
