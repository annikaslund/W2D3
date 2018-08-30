require 'rspec'
require_relative '../lib/poker'
require_relative '../lib/deck'
require_relative '../lib/card'
require 'byebug'


RSpec.describe Poker do
  let(:deck) { Deck.new }
  let(:players) { [Player.new('sam'), Player.new('Bob'), Player.new('Mary'), Player.new('ginger')] }
  # let(:player2) { double }
  # let(:player3) { double }
  # let(:player4) { double }

  subject { Poker.new(deck, players) }
  let(:player) { subject.players.first }

  describe "#initialize" do
    it "successfully adds a deck and players" do
      expect(subject.deck).to eq(deck)
      expect(subject.players).to eq(players)
    end
  end

  describe "#deal_cards" do
    # byebug
    it "deals 5 cards to each player" do
      subject.deal_cards
      expect(player.hand.count).to eq(5)
    end
  end

  describe "#reveal_winner" do
    it "selects the winning player" do
      subject.play
      player1 = subject.players.first.hand = [Card.new(:diamond, 14), Card.new(:diamond, 14), Card.new(:diamond, 14), Card.new(:diamond, 14), Card.new(:diamond, 14)]
      expect(subject.reveal_winner).to eq(subject.players.first)
    end
  end
end

RSpec.describe Deck do
  subject { Deck.new }

  describe "#initialize" do
    it "should return a shuffled deck" do
      expect(subject.cards.count).to eq(52)
    end
  end
end

RSpec.describe Card do
  subject { Card.new(:heart, 3) }

  describe "#initialize" do
    it "assigns a suit" do
      expect(subject.suit).to eq(:heart)
    end

    it "assigns a value" do
      expect(subject.value).to eq(3)
    end
  end
end

RSpec.describe Player do
  let(:card) { double('card', suit: :heart, value: 4) }
  subject { Player.new('will') }

  describe "#initialize" do
    it "adds a name" do
      expect(subject.name).to eq('will')
    end
  end

  describe "#discard" do
    it "has a player discard some cards" do
      subject.hand = [card, card, card, card, card]
      expect(subject.hand.count).to eq(5)
      subject.discard(1)
      expect(subject.hand.count).to eq(4)
    end
  end
end
