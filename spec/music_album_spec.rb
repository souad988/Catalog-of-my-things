require_relative '../music_album'

describe Book do
  before :each do
    @book = Book.new 'test title', 'test author'
    @json = '{"title":"test","author":"testet"}'
    @generated_json = '{"title":"test title","author":"test author"}'
  end

  it 'should be a book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'book title shoud equal test title' do
    expect(@book.title).to eql 'test title'
  end

  it 'book author shoud equal test author' do
    expect(@book.author).to eql 'test author'
  end

  it 'book rentals to be empty' do
    expect(@book.rentals).to eql []
  end

  it 'converts json to book object' do
    expect(Book.from_json(@json)).to be_instance_of Book
  end

  it 'generates json object for title and author' do
    expect(@book.to_json).to eql @generated_json
  end
end
