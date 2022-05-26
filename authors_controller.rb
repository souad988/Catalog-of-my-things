require_relative 'query'


require_relative './classes/author'

class AuthorController 
  attr_reader :authors

  def initialize
     @authors = Query.read('author').map { |json| Author.from_json(json) }
  end

  def list 
    if @genres.length.zero? 
      puts ' Author list is empty! choose the option to add an author from the list'
    else
      @authors.each do |author, index|
        puts "Author#{index + 1} id: - #{author.first_name} #{author.last_name}"
      end
    end
    @authors.length
  end
end