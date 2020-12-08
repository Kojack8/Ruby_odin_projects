# frozen_string_literal: true

# User entry
module Validate
  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    x = /\A[+-]?\d+(\.\d+)?\z/.match(obj)
    # AFTER FAILURE HERE THE TURN METHOD WILL RESTART ITSELF
    return x unless x.nil? { puts "I'm sorry. That's an invalid entry. Please try again." }
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
    self.turn if number?(turn).nil?
  end

  def check_winner
    @victory == true
  end
  attr_reader :name, :symbol, :victory
end

# Pictoral represenation of tic-tac-toe board
class Board
  def index
    puts one_row = '   |   |   '
    puts two_row = ' 1 | 2 | 3 '
    puts three_row = '___|___|___'
    puts four_row = '   |   |   '
    puts five_row = ' 4 | 5 | 6 '
    puts six_row = '___|___|___'
    puts seven_row = '   |   |   '
    puts eight_row = ' 7 | 8 | 9 '
    puts nine_row = '   |   |   '
  end
end

puts 'Player One: Enter your name'
name = gets.chomp
player_one = Player.new(name, 'X')
puts 'Player Two: Enter your name'
name = gets.chomp
player_two = Player.new(name, 'O')

x = Board.new
x.index

victory = false
counter = 0
while victory == false
  counter += 1
  if counter.odd?
    player_one.turn
    victory = player_one.check_winner
  else
    player_two.turn
    victory = player_two.check_winner
  end
end
