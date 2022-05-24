require 'date'

class Item
  attr_accessor :publish_date, :archived, :id, :name
  attr_reader :label, :author, :genre

  def initialize(id, name, publish_date, archived = false)
    @name = name
    @id = Random.rand(1..100)
    @publish_date = Date.parse(publish_date)
    @archived = archived
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
    current_date = Date.today
    time_diff = current_date.year - @publish_date.year
    time_diff >= 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private
end
