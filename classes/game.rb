require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, multiplayer, last_played_at, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    duration = Time.now.year - @last_played_at.year
    super && duration > 2
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Game.new(json['publish_date'], json['multiplayer'], json['last_played_at'], json['id'] )
  end

  def to_json(*_args)
    JSON.generate({ id: @id,
                    multiplayer: @multiplayer,
                    last_played_at: @last_played_at,
                    publish_date: @publish_date
                  })
  end
end
