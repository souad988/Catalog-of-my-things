class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name.strip
    @last_name = last_name.strip
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end

  def self.from_json(json)
    json = Json.parse(json) if json.is_a? String
    Author.new(json['first_name'], json['last_name'])
  end

  def to_json(*_args)
    JSON.generate({
                    first_name: @first_name,
                    last_name: @last_name
                  })
  end
end
