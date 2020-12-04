stocks = [17,3,6,9,15,8,6,1,10]
stocks2 = [44, 4, 5, 1, 3, 15, 1, 4, 2, 7, 2, 33]
stocks3 = [1, 1000, 3200, 400, 1]

def stock_picker(stocks)
  highest = 0
  answ1 = 0
  answ2 = 0
  len = stocks.length - 1
  len.downto(0) do |i|
    i.downto(0) do |j|
      x = stocks[i] - stocks[j]
      if x > highest
        highest = x
        answ1 = j
        answ2 = i
      end
    end
  end
  answer = []
  answer.push(answ1)
  answer.push(answ2)
  return answer

end

x = stock_picker(stocks3)
p x
