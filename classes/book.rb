require_relative '../item'

class Book < Item
  def initialize(publish_date, publisher, cover_state, _label, id = nil)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
    label&.add_item(self)
  end

  def can_be_archived?
    return true if @cover_state == 'bad'

    super.can_be_archived?
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@publish_date, @publisher, @cover_state, @label, @id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

  attr_accessor :publisher, :cover_state
end
