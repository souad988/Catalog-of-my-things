class GenreController
    def initialize()
      @genres = []
    end
  
    def list
      if @genres.length.zero?
        puts ' Genre list is empty! choose the option to add a genre from the list'
      else
        @genres.each_with_index do |genre, index|
          puts "#{index + 1}- Genre name: #{genre.name}"
        end
      end
    end
  end
  