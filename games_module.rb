require 'json'
require_relative './classes/game'

module GamesModule
    def load_games
        data = []
        file = './games.json'
        if File.exist?(file)
            JSON.parse(File.read(file)).each do |game|
                data.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
            end
        else 
            File.write(file, [])
        end
        data 
    end

    def create_games
        data = []
        @games.each do |game|
            data.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date })
        end
        open('./games.json', 'w') { |f| f << JSON.generate(data) }
    end
end