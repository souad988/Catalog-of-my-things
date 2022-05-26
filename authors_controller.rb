require_relative 'query'

require_relative './classes/author'

class AuthorController
  attr_reader :authors

  def initialize
    @authors = Query.read('author').map { |json| Author.from_json(json) }
  end

  def list
    if @authors.length.zero?
      puts ' Author list is empty! choose the option to add an author from the list'
    else
      @authors.each_with_index do |author, index|
        puts "index: #{index + 1} FirstName: #{author.first_name} LastName: #{author.last_name}"
      end
    end
    @authors.length
  end
end
