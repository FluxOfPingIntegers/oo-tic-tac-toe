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

  def input_to_index(input)
    index = input.to_i
    index -= 1
    index
  end

  def move(input, token = "X")
    if self.position_taken?(input) == false
        @board[input] = token
        @board
    end
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
        true
    else
        false
    end
  end

  def valid_move?(index)
    if index >= 0 && index < 10 && self.position_taken?(index) == false
        true
    else
        false
    end
  end

  def turn
    breaker = 0
    while breaker < 1
      puts "please select a position on the board using the numbers 1 - 9"
      input = gets.strip
      index = self.input_to_index(input)
      if self.valid_move?(index) == true
        breaker += 1
      else
        puts "I'm sorry, that is not a valid move, please try again."
      end
    end
    token = self.current_player
      self.move(index, token)
      self.display_board
  end

  def turn_count
    count = 0
    player1 = @board.count("X")
    player2 = @board.count("O")
    count += player1 + player2
    count
  end

  def current_player
    if self.turn_count % 2 == 0
        "X"
    else
        "O"
    end
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |i|
        if @board[i[0]] == @board[i[1]] && @board[i[1]] == @board [i[2]] && @board[i[0]] != " "
            win = i
        end
    end
        win
  end

  def full?
    @board.all? {|element| element == "X" || element == "O"}
  end

  def draw?
    if self.won? == false && self.full? == true
        true
    else
        false
    end
  end

  def over?
   if self.draw?
    true
   else
    self.won?
   end
  end

  def winner
    if self.won?
        winner = self.won?
        "#{@board[winner[0]]}"
    end
  end

  # def play
  #   while self.full? == false && self.won? == false
  #   self.turn
  #   end
  #   if self.draw?
  #     puts "I'm sorry but the match ended in a draw!"
  #   else
  #     self.winner
  #   end
  # end

end
#  game = TicTacToe.new
#  binding.pry