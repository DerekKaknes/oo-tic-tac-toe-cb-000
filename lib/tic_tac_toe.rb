class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player = "X")
    board[index] = player
  end

  def position_taken?(index)
    ["X", "O"].include?(board[index])
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    board.count("X") + board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |wc|
      values = board.values_at(*wc)
      if values.all? {|i| i == 'X'} || values.all? {|i| i == 'O'}
        winner = wc
        break
      end
    end
    winner
  end

  def full?
    board.count(" ") == 0
  end

  def draw?
    full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    wc = won?
    if wc
      board[wc[1]]
    end
  end
  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
