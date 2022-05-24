require 'json'
require_relative './classes/game'

module Game
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