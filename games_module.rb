require 'json'
require_relative './classes/game'

module GamesModule
  def load_games
    data = []
    file = './games.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |games|
        data.push(Game.new(games['multiplayer'], games['last_played_at'], games['publish_date']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def create_games
    data = []
    @games.each do |_games|
      data.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                  publish_date: game.publish_date })
    end
    open('./games.json', 'w') { |f| f << JSON.generate(data) }
  end
end
