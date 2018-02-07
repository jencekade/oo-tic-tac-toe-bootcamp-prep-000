def TicTacToe

  def initialize
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    if(@board[index] == " " || @board[index] == "")
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    index = input_to_index(position)
    if (!position_taken(position) && index.between?(0,8))
      return true
    else
      return false
    end
  end

  def turn
    puts "Enter 1-9:"
    input = gets()
    index = input_to_index(input)
    if(valid_move?(index))
      move(index)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count do |token|
      token == "X" || token == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X": "O"
  end
end
