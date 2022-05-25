class Author
  attr_accessor :items
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name.strip
    @last_name = last_name.strip
    @items = []
    _id = Random.rand(1..100)
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end
end
