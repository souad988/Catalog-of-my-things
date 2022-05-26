require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(id, name, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    duration = Time.now.year - @last_played_at.year
    super && duration > 2
  end

  def self.from_json(json)
    json = Json.parse(json) if json.is_a? String
    Game.new(json['multiplayer'], json['last_played_at'], json['publish_date'])
  end

  def to_json(*_args)
    JSON.generate({
      multiplayer => @multiplayer,
      last_played_at => @last_played_at,
      publish_date => @publish_date
    })
  end
end