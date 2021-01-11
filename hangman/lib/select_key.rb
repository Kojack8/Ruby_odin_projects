# Loads the dictionary and selects a single word as a secret key
class SelectKey
  def select_key
    i = rand_generator
    p @contents[i]
    key = verify(@contents[i])
    if key == false
      select_key
    else 
      key
    end 
  end

  def dict_to_arr
    file = File.open("../5desk.txt", "r")
    contents = file.read
    @contents = contents.split /[\r\n]+/
  end

  def rand_generator
    x = rand(0..@contents.length - 1)
  end

  def verify(key)
    if (key.length) > 4 && (key.length) < 12
      key
    else
      false
    end
  end
end