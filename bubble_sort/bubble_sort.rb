bubble = [4,3,78,2,0,2]
bubble2 = [9, 7, 4, 401, -1, 34, 999999, 0 , 11, 11, -999]

def bubble_sort(bubble)
  len = bubble.length - 1
  loop do
    perfect = true
    for i in 0..(len - 1)
      if bubble[i] > bubble[i + 1]
        bubble[i + 1], bubble[i] = bubble[i], bubble[i + 1]
        perfect = false
      end
    end
    break if perfect == true
  end
  return bubble
end

x = bubble_sort(bubble2)
p x