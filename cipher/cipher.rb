def cipher(x, y)
  y = y % 26
  x = x.codepoints
  answer = []
  x.each { |x| 
  if (x > 64 && x < 91)
    x += y  
    if x > 90
      x -= 26
    end
    answer.push(x.chr)
  elsif (x > 96 && x < 123)
    x += y  
    if x > 122
      x -= 26
    end
    answer.push(x.chr)
  else
    answer.push(x.chr)
  end
  }
  puts answer.join
  
end

puts "Enter your message to be scrambled"
x = gets.chomp
puts "Now enter a positive int to rotate your cipher"
y = gets.to_i
if y < 1 || x == ''
  puts "Invalid entry. Please try again"
  exit
end
cipher(x, y)
