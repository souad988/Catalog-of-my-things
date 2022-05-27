class Label
  def initialize(title, color, _id = nil)
    @id = Random.rand(1..2000)
    @items = []
    @title = title
    @color = color
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_label(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, color, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

  attr_reader :items, :id
  attr_accessor :title, :color
end
