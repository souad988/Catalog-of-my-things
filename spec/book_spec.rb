require_relative '../classes/book'

require './label'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('2020/02/02', 'publisher', 'bad', nil)
    it 'check attribute publish date' do
      expect(book.genre).to eq '2020/02/02'
    end
    it 'check attribute publisher' do
      expect(book.publisher).to eq 'publisher'
    end
    it 'check attribute cover state' do
      expect(book.cover).to eq 'bad'
    end
  end
end
