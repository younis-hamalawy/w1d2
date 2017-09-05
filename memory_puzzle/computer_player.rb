require_relative 'board.rb'
require_relative 'game.rb'
class Computer_Player
  attr_accessor :board, :guess

  def initialize
    @already_tried = Hash.new([])
    @success = []
    @upcoming_guess = nil

  end

  def prompt


  end

  def get_input
    return @upcoming_guess if @upcoming_guess
    #NEED TO RESET upcoming_guess AFTER RETURNING upcoming_guess
    # p @already_tried.select {|k,v| v.length == 2}
    if @already_tried.select {|k,v| v.length == 2}.length > 0
      check = @already_tried.select {|k,v| v.length == 2}
      @upcoming_guess = @already_tried[check][1]
      hguess = @already_tried[check][0]
      @success << @upcoming_guess
      @success << hguess
      @already_tried.select(check.keys)
      return @already_tried[check][0]
    end
    x_position = [0, 1, 2, 3]
    y_position = [0, 1, 2, 3, 4]
    hguess = [x_position.sample, y_position.sample]
    hguess = [x_position.sample, y_position.sample] unless @already_tried.values.include?(hguess) || @success.include?(hguess)

    # the_guess = @board.reveal([guess[0], guess[1]])
    p @already_tried
    p @guess
    @already_tried[@guess] << hguess
    hguess
  end


end
