class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def discard(count)
    count.times { @hand.pop }
  end

  def total
    total = 0

    @hand.each do |card|
      total += card.value
    end

    total 
  end
end
