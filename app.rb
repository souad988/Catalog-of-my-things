require_relative './inputs'
require_relative './item'
require_relative './games_module'
require_relative './authors_module'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/book'
require_relative './classes/label'
require_relative './other_methods'

class App
  include Inputs
  include GamesModule
  include AuthorsModule
  include OtherMethods

  def initialize
    @games = load_games
    @authors = load_authors
    @books = read_data('books.json')
    @labels = read_data('labels.json')
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

  def list_all_labels
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def list_all_books
    @books.each { |book| p "Title: #{book.publisher}" }
  end

  def add_book
    puts 'Enter Publish date'
    publish_date = input_string
    # puts 'Enter If Archived ? [Y/N]'
    # archived = input_bool
    puts 'Enter Publisher'
    publisher = input_string
    puts 'Enter state of cover [bad/good]'
    cover_state = input_string
    book = Book.new(publish_date, publisher, cover_state, nil)

    # # select author / add author
    # puts "Enter Author's First name"
    # author_first_name = input_string_no_num
    # puts "Enter Author's last name"
    # author_last_name = input_string_no_num
    # author = Author.new(author_first_name, author_last_name)

    # add label / select a label
    puts 'Enter label title'
    label_title = input_string
    puts 'Enter label color'
    label_color = input_string
    label = Label.new(label_title, label_color)

    # # add genre
    # puts 'Enter genre name'
    # genre_name = input_string
    # genre = Genre.new(genre_name)

    # book.add_author(author)
    book.add_label(label)
    # book.add_genre(genre)
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
      'List of authors',
      'List all genres',
      'List all labels',
      'List all games',
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
    methods[1] = method(:list_all_authors)
    methods[2] = method(:list_all_games)
    methods[3] = method(:add_game)
    # methods[4] = method(:add_new_book)
    # methods[5] = method(:add_new_rental)
    # methods[6] = method(:list_person_rentals)
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
