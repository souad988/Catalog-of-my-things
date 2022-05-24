require 'date'
require_relative '../item'

class Game < Item 
    attr_accessor :multiplayer, :last_played, :publish_date

    