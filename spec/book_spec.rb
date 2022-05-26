require_relative '../classes/book'
require 'date'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('2020/02/02', 'publisher', 'bad', nil)
    book2 = Book.new('02-6-2020', 'publisher', 'good', nil)

    it 'check attribute publish date' do
      expect(book.genre).to be_nil
    end
    it 'check attribute publisher' do
      expect(book.publisher).to eq 'publisher'
    end
    it 'check attribute cover state' do
      expect(book.cover_state).to eq 'bad'
    end
    
    it 'check can_be_archived method to return true' do
      expect(book2.can_be_archived?).to be_falsey
    end
  end
end
