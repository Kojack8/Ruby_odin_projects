dictionary = ["it", "pennywise", "howdy", "howdy", "below","down","go","going","horn","how","howdy","go", "it","i","low","own","part","partner","sit"]

def substring(word, dictionary)
  answer = {}
  for i in (0..word.length - 1) do
    x = dictionary.count { |x| x == word[i] }
    answer[word[i]] = x
  end
  puts answer
end

x = gets.chomp.downcase
x = x.split(" ")
substring(x, dictionary)