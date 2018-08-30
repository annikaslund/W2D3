def remove_dups(arr)
  arr.uniq
end

class Array
  def two_sum
  results = []
    (0...self.length - 1).each do |i|
      (i+1...self.length).each do |j|
        if self[i] + self[j] == 0
          results << [i, j]
        end
      end
    end

    results
  end
end

def my_transpose(arr1)
  results = Array.new(3) { [] }

  arr1.each_with_index do |arr, idx|
    arr.each_with_index do |el, idx2|
      results[idx2] << el
    end
  end

  results
end

def stock_picker(prices)
  min = prices.min
  max = prices.max
  [prices.index(min), prices.index(max)]
end

class TowersOfHanoi
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def make_move(pos)
    start_stack, end_stack = pos
    @board[end_stack] << @board[start_stack].pop
  end

  def valid_move?(pos)
    start_stack, end_stack = pos
    return false if @board[start_stack].empty?
    return true if @board[end_stack].empty?
    return false if @board[start_stack].last > @board[end_stack].last
    true
  end

  def game_over?
    if @board[0][0] == nil
      return true
    end
    false
  end
end
















# place holder
