require 'date'
require_relative '../item'

class Game < Item 
    attr_accessor :multiplayer, :last_played_date, :publish_date

    def initialize(multiplayer, last_played_date, publish_date)
        super(id, name, publish_date)
        @multiplayer = multiplayer
        @last_played_date = Date.parse(last_played_date)
    end