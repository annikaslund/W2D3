require 'rspec'
require_relative '../lib/tdd'

describe "Test Driven Development" do
  context "when passed an empty array" do
    it "should return an array" do
      expect(remove_dups([])).to eq([])
    end
  end

  it "should remove duplicates" do
    expect(remove_dups([3,2,2,1])).to eq([3,2,1])
  end

  describe "#two_sum" do
    it "returns the correct pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "correctly transposes the array" do
      arr1 = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
    arr2 = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]  ]
      expect(my_transpose(arr1)).to match_array(arr2)
    end
  end

  describe "#stock_picker" do
    it "returns a pair of numbers" do
      prices = [10, 5, 13]
      expect(stock_picker(prices)).to eq([1, 2])
    end
  end
end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe "#initialize" do
    it "starts with 3 arrays" do
      expect(game.board).to eq([[1, 2, 3],[],[]])
    end
  end

  describe "#make_move" do
    it "only moves one piece at a time" do
      game.make_move([0, 1])
      expect(game.board).to eq([[1, 2], [3], []])
    end
  end

  describe "#game_over?" do
    it "returns true when the game is over" do
      game.board = [[], [1, 2, 3], []]
      expect(game.game_over?).to eq(true)
    end
  end

  describe "#valid_move?" do
    it "returns false for an invalid move" do
      expect(game.valid_move?([1, 0])).to eq(false)
    end

    it "returns true for a valid move" do
      expect(game.valid_move?([0, 1])).to eq(true)
    end
  end
end


















# place holder
