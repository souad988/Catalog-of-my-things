class Genre
  attr_accessor :name
  attr_reader :id
  def initialize(name, id = nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Genre.new(json['name'], json['id'])
  end

  def to_json(*_args)
    JSON.generate({ id: @id, name: @name })
  end
end
