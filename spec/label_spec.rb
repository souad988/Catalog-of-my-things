require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'When testing the Label class' do
    label = Label.new('label_title', 'label_color')
    book = Book.new(publish_date, 'publisher', cover_state, nil)
    label.add_item(book)
    it 'label instance should return attributes it was created with' do
      expect(label.title).to eql 'label_title'
      expect(label.color).to eql 'label_color'
    end
    it 'check length of items to be 1' do
      expect(label.items.length).to eql 1
    end
  end
end
