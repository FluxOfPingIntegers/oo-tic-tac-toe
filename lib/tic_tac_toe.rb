require 'pry'
class TicTacToe
attr_accessor :board

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    [0, 4, 8],
    [2, 4, 6]
]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0..2].join(" | ")} "
    puts "-----------"
    puts " #{@board[3..5].join(" | ")} "
    puts "-----------"
    puts " #{@board[6..8].join(" | ")} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end
  

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index >=0 && index <= 8
  end

  def turn_count
    @board.select{|position| position != " "}.size
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Enter the space you'd like to play on:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Invalid move, try again"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]]
    end
  end

  def full?
    turn_count > 8
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    won? ? congratulate : draw
  end

  def congratulate
    puts "Congratulations #{winner}!"
  end

  def draw
    puts "Cat's Game!"
  end

end