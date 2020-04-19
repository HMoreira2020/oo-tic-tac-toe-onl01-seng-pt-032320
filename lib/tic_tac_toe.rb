class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

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

  def move(index, current_player)
    @board[index] = current_player 
  end 

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end 

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  

  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   index = input_to_index(input)
  #   if valid_move?(index)
  #     move(index, current_player)
  #     display_board 
  #   else
  #     turn 
  #   end
  # end 

  def turn_count
    @board.count{|token| token.downcase == "x" || token.downcase == "o"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O" 
  end 


  def won?
    WIN_COMBINATIONS.detect do |win_combination| 
    win_combination.all? {|win_index| @board[win_index] == "X"} || win_combination.all? {|win_index| @board[win_index] == "O" }
    end
  end 
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end 

  def draw?
    full? && !won?
  end 

  def over?
    if won? || draw? || full?
      return true 
    end 
  end 

  def winner
    if won? != nil
      winner = won?
      return @board[winner[0]]
    else
      nil
    end
  end
 
 
  def play
    until over? == true
      turn
    end
    if won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end 
  

end 
  

    
  
  
  