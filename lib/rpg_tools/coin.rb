module RpgTools
  class Coin
    class << self
      def flip
        rand(2) == 1 ? 'heads' : 'tails'
      end
    end
  end
end
