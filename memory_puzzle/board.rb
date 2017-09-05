#populate should fill the board with a set of shuffled Card pairs
#render should print out a representation of the Board's current state
#won? should return true if all cards have been revealed.
#reveal should reveal a Card at guessed_pos (unless it's already face-up,
#in which case the method should do nothing). It should also return the
# value of the card it revealed (you'll see why later).
require_relative 'card.rb'
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(4) { Array.new(5) }
    self.populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    arr_of_cards = ([:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]*2).shuffle
    count = 0
    (0...4).each do |x|
      (0...5).each do |y|
        self[[x, y]] = Card.new(arr_of_cards[count])
        count += 1
      end
    end
    self
  end

  def render
    temp_grid = Array.new(4) { Array.new(5) }
    (0...4).each do |x|
      (0...5).each do |y|
        temp_grid[x][y] = self[[x, y]].to_s
      end
    end
    (0..3).each do |num|
      puts "#{temp_grid[num]}"
    end
  end

  def won?
    count = 0
    (0...4).each do |x|
      (0...5).each do |y|
        count += 1 if @grid[x][y].revealed
      end
    end
    count == 20
  end

  def reveal(position)
    p self[position].value
  end

end
