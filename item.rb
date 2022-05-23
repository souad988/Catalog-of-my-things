class Item
  attr_accessor :publish_date

  def initialize(publish_date, archived, id = nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @publish_date = publish_date
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

  private

  attr_accessor :archived
  attr_reader :id
end
