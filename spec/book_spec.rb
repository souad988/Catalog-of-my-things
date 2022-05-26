require 'date'
require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  context 'When testing the Book class' do
    publish_date = '02/02/2020'
    cover_state = 'bad'

    book = Book.new(publish_date, 'publisher', cover_state, nil)
    book2 = Book.new(Date.today.prev_year(1), 'publisher', 'bad', nil)

    it 'check attribute publish date' do
      expect(book.genre).to eql publish_date
    end
    it 'check attribute publisher' do
      expect(book.publisher).to eql 'publisher'
    end

    it 'check attribute cover state' do
      expect(book.cover).to eql cover_state
    end

    it 'can be archived should be true' do
      expect(book.can_be_archived?).to eql true
    end

    it 'can be archived should be false' do
      expect(book2.can_be_archived?).to eql false
    end
  end
end
