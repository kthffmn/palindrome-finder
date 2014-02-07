############################
### P A L I N D R O M E  ###
############################

class Palindrome
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def get_longest
    increment.max_by{|a| a.length}
  end

  def increment
    max = string.length
    array = []
    ################################################# mirrored around a letter
    first_i = 0
    while first_i < max
      array << get_letter_palindrome(first_i)
      first_i += 1
    end
    ################################################# mirrored around nothing
    second_i = 0
    while second_i < max
      array << get_mirror_palindrome(second_i)
      second_i += 1
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