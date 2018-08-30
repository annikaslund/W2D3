require_relative 'card'

class Deck
  CARD_VALS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  SUITS = [:club, :heart, :diamond, :spade]

  attr_reader :cards

  def self.setup_deck
    result = []

    SUITS.each do |suit|
      CARD_VALS.each do |val|
        result << Card.new(suit, val)
      end
    end

    result
  end

  def initialize
    @cards = Deck.setup_deck
    @cards.shuffle!
  end
end
