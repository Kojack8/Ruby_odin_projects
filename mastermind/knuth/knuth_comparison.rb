require_relative './../compare_answer'

class KnuthComparison
  def run_comparison(key, knu_arr)
    comparison_arr = []
    # creates a massive array that is made up of 1296 key-answer comparison arrays
    knu_arr.each { |x|
      compare = CompareAnswer.new(key, x)
      comparison = compare.run_comparison
      comparison_arr << comparison
    }
    comparison_arr
  end

  def remove_comparisons(knu_arr, comparison_arr, comparison)
    counter = 0
    comparison_arr.each { |x| 
      if x != comparison
        knu_arr.slice!(counter)
        comparison_arr.slice!(counter)
        counter -= 1
      else
        counter += 1
      end
    }
    knu_arr
  end

  def default_possibilities
    comp_possibilities = {
      [2, 2, 2, 2] => 0, [2, 2, 2, 0] => 0, [2, 2, 0, 0] => 0, 
      [2, 0, 0, 0] => 0, [0, 0, 0, 0] => 0, [2, 2, 1, 1] => 0,
      [2, 2, 1, 0] => 0, [2, 1, 1, 0] => 0, [2, 1, 0, 0] => 0,
      [1, 1, 0, 0] => 0, [1, 0, 0, 0] => 0, [1, 1, 1, 1] => 0, 
      [1, 1, 1, 0] => 0, [2, 1, 1, 1] => 0
      }
      
  end

  def calc_possibilities(comparison, poss_arr)
    p poss_arr
    poss_arr.map { |k, v| 
      if k == comparison
        poss_arr[k] += 1
      end
      
    }
    return poss_arr



  end
end

