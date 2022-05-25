require_relative 'inputs'
require_relative 'book'
require_relative 'other_methods'
# require_relative 'author'
# require_relative 'genre'
require_relative 'label'


@books = read_data('books.json')
# List all books
def list_all_books
  @books.each { |book| p "Title: #{book.publisher}" }
end

# Add a book
def add_book
  puts 'Enter Publish date'
  publish_date = input_string
  puts 'Enter If Archived ? [Y/N]'
  archived = input_bool
  puts 'Enter Publisher'
  publisher = input_string
  puts 'Enter state of cover [bad/good]'
  cover_state = input_string
  book = Book.new(publish_date, archived, publisher, cover_state)

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
  @books << book
  store_data('books.json', @books)
end