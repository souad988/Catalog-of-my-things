require_relative '../genre'
class GenreController
    attr_reader :genres
    def initialize()
      @genres = Query.read('genre').map { |json| Genre.from_json(json) }
    end
  
    def list
      if @genres.length.zero?
        puts ' Genre list is empty! choose the option to add a genre from the list'
      else
        @genres.each_with_index do |genre, index|
          puts "- Genre#{index + 1} id: #{genre.id} name: #{genre.name}"
        end
      end
    @genres.length
    end
  end
  