require_relative './inputs'
require_relative './item'
require_relative './games_module'
require_relative './authors_module'
require_relative './classes/game'
require_relative './classes/author'
require_relative './controllers/music_album_controller'
require_relative './utils'
require_relative 'query'
require_relative 'music_album'
require_relative './controllers/genre_controller'
class App
  include Inputs
  include GamesModule
  include AuthorsModule

  def initialize
    @games = load_games
    @authors = load_authors
    @music_controller = MusicAlbumController.new
    @genre_controller = GenreController.new
  end

  def list_all_authors
    puts 'Authors:'
    @authors.each do |author|
      puts "First Name: #{author.first_name} "
      puts "Last Name: #{author.last_name} "
    end
  end

  def list_all_games
    puts 'Games:'
    @games.each do |games|
      puts "Multiplayer: #{games.multiplayer}, Publish Date: #{games.publish_date},
      Last played date: #{games.last_played_at}"
    end
  end

  def add_game
    puts 'Please write multiplayer: '
    multiplayer = input_bool
    puts 'Please write last played date [Enter date in format (yyyy-mm-dd)]'
    last_played_at = input_string
    puts 'Please write date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = input_string
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(game)
    puts 'Game added successfully!'
  end

  ########## MUSIC ALBUM FEATURE ###########################
  def add_music_album
    data = Utils.data(['publish_date', 'on_spotify [Y/N]'])
    genre = @genre_controller.genres[Utils.list_data(@genre_controller) - 1]
    @music_controller.add(data['publish_date'], data['on_spotify [Y/N]'], genre)
    puts "New music album added successfully!"
  end

  def list_music_albums
    @music_controller.list
  end

  def list_genres
    @genre_controller.list
  end
########## MUSIC ALBUM FEATURE ###########################
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

  def exit_app
    @music_controller.save
    exit(true)
  end

  def display_choice(option)
    methods = {}
    # Placeholder functions need to be replaced
    # methods[1] = method(:list_all_authors)
    # methods[2] = method(:list_all_games)
    # methods[3] = method(:add_game)
    # methods[4] = method(:add_new_book)
    methods[5] = method(:list_genres)
    methods[2] = method(:list_music_albums)
    methods[10] = method(:add_music_album)
    methods[13] = method(:exit_app)
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
