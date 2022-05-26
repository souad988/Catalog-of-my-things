module Inputs
  def input_number(min, max)
    input = nil
    while input.nil?
      puts "Enter number between #{min} and #{max} "
      new_input = gets.chomp.to_i
      input = new_input unless new_input < min || new_input > max
    end
    input
  end

  def input_string
    input = nil
    while input.nil?
      new_input = gets.chomp
      input = new_input.strip
    end
    input
  end

  def input_string_no_num
    input = nil
    while input.nil?
      new_input = gets.chomp
      input = new_input unless /[1-9]/.match(new_input) || new_input.strip.length < limit
    end
    input
  end

  def input_bool
    input = nil
    while input.nil?
      print '[Y/N]: '
      new_input = gets.chomp
      input = new_input if new_input.downcase == 'y' || new_input.downcase == 'n'
    end
    input.downcase == 'y'
  end
end
