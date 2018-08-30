require_relative 'Player'
require_relative 'Deck'

class Poker
  attr_reader :deck, :players

  def initialize(deck, players)
    @players = players
    @deck = deck
    @discarded = []
  end

  def deal_cards
    @players.each do |player|
      p player.name
      until player.hand.count == 5
        player.hand << @deck.cards.pop
      end
    end
  end

  def play
    deal_cards
    @players.each do |player|
      player.discard(2)
    end
    deal_cards
    puts reveal_winner.name
  end

  def reveal_winner
    max_val = 0
    max_player = nil

    @players.each do |player|
      if player.total > max_val
        max_val = player.total
        max_player = player
      end
    end

    max_player
  end

  # play
  # round 1
  # round 2

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new('sam')
  player2 = Player.new('will')
  player3 = Player.new('mary')
  player4 = Player.new('sara')
  all_players = [player1, player2, player3, player4]
  deck = Deck.new

  Poker.new(deck, all_players).play
end
