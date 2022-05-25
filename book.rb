require_relative 'item'

class Book < Item
  def initialize(publish_date, archived, publisher, cover_state, id = nil)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad'
    super.can_be_archived?
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@publish_date, @archived, @publisher, @cover_state, @id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

  attr_accessor :publisher, :cover_state
end
