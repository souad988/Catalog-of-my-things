require_relative 'query'
require_relative 'utils'
require_relative './inputs'
require_relative './item'
require_relative './games_controller'
require_relative './authors_controller'
require_relative './classes/game'
require_relative './classes/author'

class App
  include Inputs
  include Utils
  def initialize
    @game_controller = GamesController.new
    @author_controller = AuthorController.new
  end

  def list_all_authors
   @author_controller.list
  end

  def list_all_games
   @game_controller.list
  end

  def add_game
    data = Utils.data(%w[multiplayer publish_date last_played_at])
    author = @author_controller.authors[Utils.list_data(@author_controller) - 1]
    @game_controller.add_game(data, author)
    puts 'Game added successfully!'
  end

  def display_menu
    options = [
      # 'List all books',
      # 'List all music albums',
      # 'List all movies',
      'List of authors',
      # 'List all genres',
      # 'List all labels',
      'List all games',
      # 'List all sources',
      # 'Add a book',
      # 'Add a music album',
      # 'Add a movie',
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
    methods[1] = method(:list_all_authors)
    methods[2] = method(:list_all_games)
    methods[3] = method(:add_game)
    # methods[4] = method(:add_new_book)
    # methods[5] = method(:add_new_rental)
    # methods[6] = method(:list_person_rentals)
    methods[option].call
  end

  def run
    flag = true
    while flag
      min_option = 1
      max_option = 13
      display_menu
      option = input_number(min_option, max_option)
      flag = false if option == max_option
      display_choice(option) if option >= min_option && option <= max_option
    end
  end
end
