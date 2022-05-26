require_relative 'query'

class GamesController
  def initialize() 
    @games = Query.read('game').map { |json| Game.from_json(json) }
  end

  def list 
    if @games.length.zero? 
      puts ' Game list is empty! choose the option to add a game from the list'
    else
      @games.each do |game, index|
        puts "Game #{index + 1} id: - #{game.multiplayer} #{game.publish_date} #{game.last_played_at}"
      end
      puts ''
    end
  end

  def add(multiplayer, publish_date, last_played_at)
    game = Game.new(multiplayer, publish_date, last_played_at)
    game.add_author(author)
    @games.push(game)
    puts 'Game added successfully!'
  end

  def save 
    serialized_games = @games.map(&:to_json)
    Query.write('game', serialized_games)
  end
end