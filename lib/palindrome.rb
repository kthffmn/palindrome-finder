############################
### P A L I N D R O M E  ###
############################

class Palindrome
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def get_longest
    result = increment.max_by{|a| a.length}
    if result.length < 2
      "There are no palindromes in '" + string + "'."
    else
      "The longest palindrome is '" + result + "'."
    end
  end

  def increment
    max = string.length
    array = []
    ################################################# mirrored around a letter
    counter_one = 0
    while counter_one < max
      array << get_letter_palindrome(counter_one)
      counter_one += 1
    end
    ################################################# mirrored around nothing
    counter_two = 0
    while counter_two < max
      array << get_mirror_palindrome(counter_two)
      counter_two += 1
    end 
    ################################################# returns final array
    array
  end

  def get_letter_palindrome(i)
    new_string = ""
    new_string << string[i]
    counter = 1
    while string[i-counter] == string[i+counter] && i+counter < string.length && i-counter >= 0
      new_string << string[i-counter]
      counter += 1
    end
    new_string.insert(0, new_string[1..-1].reverse)
  end

  def get_mirror_palindrome(i)
    new_string = ""
    counter = 0
    while string[i-counter] == string[i+1+counter] && i+1+counter < string.length && i-counter >= 0
      new_string << string[i-counter]
      counter += 1
    end
    new_string.insert(0, new_string.reverse)
  end

end