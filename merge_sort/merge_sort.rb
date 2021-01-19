# frozen_string_literal: true

# Merge sort algo for arrays
class MergeSort
  def merge_sort(array)
    if array.length > 1
      split_arr = split(array)
      split_arr[0] = merge_sort(split_arr[0])
      split_arr[1] = merge_sort(split_arr[1])
      merge(split_arr[0], split_arr[1])
    else
      array
    end
  end

  def split(array)
    arr3 = []
    arr1 = array.slice(0..((array.length / 2) - 1))
    arr2 = array.slice((array.length / 2)..-1)
    arr3.push(arr1)
    arr3.push(arr2)
  end

  def merge(arr1, arr2)
    arr3 = []
    unless arr1.empty? || arr2.empty?
      if arr1[0] < arr2[0]
        arr3.push(arr1[0])
        arr1.slice!(0..0)
      else
        arr3.push(arr2[0])
        arr2.slice!(0..0)
      end
    end
    arr3 + arr1 + arr2
  end
  

end
