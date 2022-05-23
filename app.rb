require_relative './inputs'

class App
  include Inputs

  def display_menu
    options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List of games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]

    puts 'Please choose an option by entering a valid number: '
    puts ' '
    options.each_with_index { |choice, index| puts "#{index + 1} - #{choice}" }
  end

  def display_choice(option)
    case option
    when 1
      puts 'option 1'
    when 2
      puts 'option 2'
    when 3
      puts 'option 3'
    when 4
      puts 'option 4'
    when 5
      puts 'option 5'
    when 6
      puts 'option 6'
    when 7
      puts 'option 7'
    when 8
      puts 'option 8'
    when 9
      puts 'option 9'
    when 10
      puts 'option 10'
    when 11
      puts 'option 11'
    when 12
      puts 'option 12'
    end
  end
end
