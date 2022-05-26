require_relative './inputs'
require_relative './item'
require_relative './games_controller'
require_relative './authors_controller'
require_relative './classes/game'
require_relative './classes/author'
require_relative './controllers/music_album_controller'
require_relative './utils'
require_relative 'query'
require_relative 'music_album'
require_relative './controllers/genre_controller'
require_relative './classes/book'
require_relative './classes/label'
require_relative './other_methods'

class App
  include Inputs
  include OtherMethods

  def initialize
    @game_controller = GamesController.new
    @author_controller = AuthorController.new
    @music_controller = MusicAlbumController.new
    @genre_controller = GenreController.new
    @books = read_data('books.json')
    @labels = read_data('labels.json')
  end

  def list_all_authors
    @author_controller.list
  end

  def list_all_games
    @game_controller.list
  end

  def add_game
    data = Utils.data(['multiplayer [Y/N]', 'publish_date', 'last_played_at'])
    author = @author_controller.authors[Utils.list_data(@author_controller) - 1]
    @game_controller.add(data['multiplayer'], data['publish_date'], data['last_played_at'], author)
    puts 'Game added successfully!'
  end

  ########## MUSIC ALBUM FEATURE ###########################
  def add_music_album
    data = Utils.data(['publish_date', 'on_spotify [Y/N]'])
    genre = @genre_controller.genres[Utils.list_data(@genre_controller) - 1]
    @music_controller.add(data['publish_date'], data['on_spotify [Y/N]'], genre)
  end

  def list_music_albums
    @music_controller.list
  end

  def list_genres
    @genre_controller.list
  end

  def list_all_labels
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def list_all_books
    @books.each { |book| p "Title: #{book.publisher}" }
  end

  def add_book
    puts 'Enter Publish date'
    publish_date = input_string
    puts 'Enter Publisher'
    publisher = input_string
    puts 'Enter state of cover [bad/good]'
    cover_state = input_string
    book = Book.new(publish_date, publisher, cover_state, nil)

    # add label / select a label
    puts 'Enter label title'
    label_title = input_string
    puts 'Enter label color'
    label_color = input_string
    label = Label.new(label_title, label_color)

    book.add_label(label)
    @labels << label
    @books << book
    store_data('books.json', @books)
    store_data('labels.json', @labels)
  end

  def display_menu
    options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List of games',
      'List all genres',
      'List all authors',
      'List all labels',
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
    @game_controller.save
    exit(true)
  end

  def display_choice(option)
    methods = {}
    # Placeholder functions need to be replaced
    methods[1] = method(:list_all_books)
    methods[2] = method(:list_music_albums)
    # methods[3] = method(:list_all_movies)
    methods[4] = method(:list_all_games)
    methods[5] = method(:list_genres)
    methods[6] = method(:list_all_authors)
    methods[7] = method(:list_all_labels)
    # methods[8] = method(:list_all_sources)
    methods[9] = method(:add_book)
    methods[10] = method(:add_music_album)
    # methods[11] = method(:add_movie)
    methods[12] = method(:add_game)
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
      display_choice(option) if option >= min_option && option <= max_option
      flag = false if option == max_option
    end
  end
end
