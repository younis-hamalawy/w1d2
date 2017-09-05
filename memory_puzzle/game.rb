require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  attr_accessor :board, :guess
  def initialize
    @human_player = Human_Player.new
    @computer_player = Computer_Player.new
    @current_player = @human_player
    @board = Board.new
    @previous_guess = nil

  end

  def switch_player
    if @current_player == @human_player
      @current_player = @computer_player
    else
      @current_player = @human_player
    end
  end

  def play
    counter = 0
    until @board.won?
      @current_player.prompt
      guessed_pos = @current_player.get_input
      make_guess([guessed_pos[0].to_i, guessed_pos[-1].to_i])
      counter += 1
      if counter == 2
        switch_player
        counter = 0
      end
    end
    puts "Good Game! You have won!"
  end

  def make_guess(guessed_pos)
    # p guessed_pos.split.to_i
    if @current_player == @computer_player
      @computer_player.guess = @board.reveal(guessed_pos)
      p 'x'
      p @computer_player.guess
      p 'x'
    else
      @board.reveal(guessed_pos)
    end

    @board.render
    if @previous_guess == nil
      @previous_guess = guessed_pos
    else
      @board.render if @board[guessed_pos] == @board[@previous_guess]
      @previous_guess = nil
    end

  end


end
