# frozen_string_literal: true

# Loads the dictionary and selects a single word as a secret key
class SelectKey
  def select_key
    i = rand_generator
    key = verify(@contents[i])
    if key == false
      select_key
    else
      key
    end
  end

  def dict_to_arr
    file = File.open('../5desk.txt', 'r')
    contents = file.read
    @contents = contents.split(/[\r\n]+/)
  end

  def rand_generator
    rand(0..@contents.length - 1)
  end

  # rejects proper nouns and words either too long or short
  def verify(key)
    if (key.length) > 4 && (key.length) < 12
      if key[0] =~ /[a-z]/
        key
      else false
      end
    else
      false
    end
  end
end
