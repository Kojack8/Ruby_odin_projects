# frozen_string_literal: true
require 'yaml'

# allows the user to load a previously saved game or start a new one
class LoadGame
  def load_game
    load_text
    correct = false
    while correct == false
      x = gets.chomp
      correct = validate(x)
    end
    x.to_i == 1
  end

  def load_text
    puts "If you'd like to start a new game enter \"1\" now."
    puts "Or if you'd like to load a saved game enter \"2\"."
  end

  def validate(choice)
    if choice.to_i < 1 || choice.to_i > 2
      puts 'I\'m sorry. That\'s an invalid input. Please try again.'
      false
    else
      true
    end
  end

  def load_sequence 
    load_choices
    unless user_entry == false
      file = File.open(@saved_files[@save_index])
      contents = file.read
      YAML.load(contents)
    else 
      false
    end
  end
  def load_choices
    puts "Select a file from below to load or type exit to start a new game."
    @saved_files = Dir["./../saved/**/*.yaml"]
    @available_files = Dir["./../saved/**/*.yaml"]
    puts @available_files.each { |n| n.slice!(0..10)}
  end
  def user_entry
    validator = false
    while validator == false
      input = gets.chomp
      if @available_files.include?(input)
        validator = true
        @save_index = @available_files.index(input)
      elsif input.downcase == "exit"
        return false
      else
        puts "I'm sorry. That's an invalid entry. Please try again minding " \
        "capitalization of filenames or type exit to start a new game."
      end
    end
    input
  end
end
