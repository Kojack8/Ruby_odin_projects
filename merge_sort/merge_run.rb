require_relative 'merge_sort'

merge = MergeSort.new

#only works with values >= 0 
p merge.merge_sort([3, 1, 4, 2, 5, 6, 7, 8, 0, 9, 66, 11111])