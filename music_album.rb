require './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, _id = nil, _source = nil, _label = nil, _author = nil, _genre = nil, archived: false)
    super(publish_date, id, source, label, author, genre, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super.can_be_archived && @on_spotify
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    MusicAlbum.new(json['publish_date'], json['on_spotify'], json['id'], json['source'], json['label'], json['author'],
                   json['genre'], archived: json['archived'])
  end

  def to_json(*_args)
    JSON.generate({ id: @id, publish_date: @publish_date, on_spotify: @on_spotify, source: @source, label: @label,
                    genre: @genre, archived: @archived })
  end
end
