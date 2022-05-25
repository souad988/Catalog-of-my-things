require './item'
class MusicAlbum < Item
  def initialize(publish_date, on_spotify, id = nil)
    super(publish_date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super.can_be_archived && @on_spotify
  end
  
  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    MusicAlbum.new(json['publish_date'], json['on_spotify'], json['id'])
  end

  def to_json(*_args)
    JSON.generate({ id: @id, publish_date: @publish_date, on_spotify: @on_spotify })
  end
  
end
