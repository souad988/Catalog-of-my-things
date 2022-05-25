require_relative './inputs'
require_relative './book_methods'
require_relative './label_methods'

class App
  include Inputs
  def initialize
    @books = read_data('books.json')
    @labels = read_data('labels.json')
  end

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
    methods = {}
    # Placeholder functions need to be replaced
    methods[1] = method(:list_all_books)
    methods[6] = method(:list_all_labels)
    methods[9] = method(:add_book)
    methods[option].call
  end

  def run
    flag = true
    while flag
      min_option = 1
      max_option = 13
      display_menu
      option = input_number(min_option, max_option)
      display_choice(option) if option >= min_option && option < max_option
      flag = false if option == max_option
    end
  end
end
