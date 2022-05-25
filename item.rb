require 'date'
class Item
  attr_accessor :publish_date
  attr_reader :source, :label, :author, :genre

  def initialize(publish_date, id = nil, source = nil, label = nil, author = nil, genre = nil, archived: false)
    @id = id.nil? ? Random.rand(1..1000) : id
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @source = source
    @label = label
    @author = author
    @genre = genre
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def can_be_archived?
    Date.today.prev_year(10) > @publish_date
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  attr_accessor :archived
  attr_reader :id
end
