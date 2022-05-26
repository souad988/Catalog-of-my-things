require 'json'
class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name, id = nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @first_name = first_name.strip
    @last_name = last_name.strip
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Author.new(json['first_name'], json['last_name'], json['id'])
  end

  def to_json(*_args)
    JSON.generate({ id: @id,
                    first_name: @first_name,
                    last_name: @last_name })
  end
end
