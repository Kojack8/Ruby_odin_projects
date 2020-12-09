# frozen_string_literal: true

# Only accepts user input 1-9
module Validate
  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    x = /\A[+-]?\d+(\.\d+)?\z/.match(obj)
    # sets input numbers outside 1-9 to nil tp reject
    if obj.to_i < 1 || obj.to_i > 9
      x = nil
    end
    return obj.to_i unless x.nil? 
      return x
  end
end

# Structure supporting both players and their actions
class Player
  include Validate
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @victory = false
  end

  def turn
    puts "#{name}, enter the number of the square you'd like to occupy"
    turn = gets.chomp
    # checks if user inputs a number. if not it restarts this method
    x = number?(turn)
    while x.nil?
      puts "I'm sorry. That's an invalid entry. Please try again."
      x = self.turn
    end
    return x
  end

  def check_winner
    @victory == true
  end
  attr_reader :name, :symbol, :victory
end

# Pictoral represenation of tic-tac-toe board
class Board
  # if any one of these variables is true the relevant space ((0-8) + 1) is occupied
  def initialize
    @occupied = []
    for i in 0..8
      @occupied.push(false)
      @one_row = '   |   |   '
      @two_row = +' 1 | 2 | 3 '
      @three_row = '___|___|___'
      @four_row = '   |   |   '
      @five_row = +' 4 | 5 | 6 '
      @six_row = '___|___|___'
      @seven_row = '   |   |   '
      @eight_row = +' 7 | 8 | 9 '
      @nine_row = '   |   |   '
    end
  end
  
  def change(num, symb) 
    # converts user input to array counting style
    num = (num - 1)
    if @occupied[num] == false
      @occupied[num] = true
      alter_board(num, symb)
    else
      puts "That selection (#{(num + 1)}) is not available. Please try again."
      return false
    end
  end

  def alter_board(num, symb)
    if num == 0
      @two_row[1] = symb
    elsif num == 1
      @two_row[5] = symb
    elsif num == 2
      @two_row[9] = symb
    elsif num == 3
      @five_row[1] = symb
    elsif num == 4
      @five_row[5] = symb
    elsif num == 5
      @five_row[9] = symb
    elsif num == 6
      @eight_row[1] = symb
    elsif num == 7
      @eight_row[5] = symb
    elsif num == 8
      @eight_row[9] = symb
    
    end
  end

  def display
    puts @one_row
    puts @two_row 
    puts @three_row
    puts @four_row
    puts @five_row
    puts @six_row
    puts @seven_row
    puts @eight_row
    puts @nine_row
  end



end

puts 'Player One: Enter your name'
name = gets.chomp
player_one = Player.new(name, 'X')
puts 'Player Two: Enter your name'
name = gets.chomp
player_two = Player.new(name, 'O')

board = Board.new

victory = false
counter = 0
while victory == false
  counter += 1
  checker = false
  if counter.odd?
    while checker == false
      board.display
      turn = player_one.turn
      symb = player_one.symbol
      checker = board.change(turn, symb)
    end
    victory = player_one.check_winner
  else
    while checker == false
      board.display
      turn = player_two.turn
      symb = player_two.symbol
      checker = board.change(turn, symb)
    end
    victory = player_two.check_winner
  end
end
