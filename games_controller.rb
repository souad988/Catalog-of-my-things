require_relative 'query'

class GamesController
  def initialize()
    @games = Query.read('game').map { |json| Game.from_json(json) }
  end

  def list
    if @games.length.zero?
      puts ' Game list is empty! choose the option to add a game from the list'
    else
      @games.each_with_index do |game, index|
        puts "Game: #{index + 1} Multiplayer #{game.multiplayer}
        Publish Date: #{game.publish_date}
        Last Played:  #{game.last_played_at}"
      end
      puts ''
    end
  end

  def add(multiplayer, publish_date, last_played_at, author)
    game = Game.new(publish_date, multiplayer,last_played_at)
    game.add_author(author)
    @games.push(game)
  end

  def save
    serialized_games = @games.map(&:to_json)
    Query.write('game', JSON.generate(serialized_games))
  end
end
