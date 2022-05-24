require 'date'

class Item
  attr_accessor :publish_date :archived, :id
  attr_reader :label, :author, :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
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
  end

  def can_be_archived?
    Date.today.prev_year(10) > @publish_date
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private
end
