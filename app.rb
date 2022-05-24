require_relative './inputs'
require_relative './item'
require_relative './games_module'
require_relative './authors_module'
require_relative './classes/game'
require_relative './classes/author'


class App
  include Inputs
  include GamesModule
  include AuthorsModule

  def initialize
    @games = load_games
    @authors = load_authors
  end

  def list_all_authors
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end
  
  def list_all_games
    @games.each do |game|
      puts "#{game.name} #{game.publish_date}"
    end
  end

  def add_game 
    multiplayer = input_bool()
    last_played_at = input_string()
    publish_date = input_string()
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(game)
    puts "Game added successfully!"
    end
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
    methods[1] = method(:list_all_)
    methods[2] = method(:list_all_games)
    methods[3] = method(:add_new_person)
    methods[4] = method(:add_new_book)
    methods[5] = method(:add_new_rental)
    methods[6] = method(:list_person_rentals)
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

