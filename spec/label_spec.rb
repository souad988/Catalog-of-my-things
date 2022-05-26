require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'When testing the Label class' do
    label = Label.new('label_title', 'blue')
    book = Book.new('2020/02/02', 'publisher', 'bad', nil)
    label.add_item(book)
    it 'label title check' do
      expect(label.title).to eq 'label_title'
    end
    it 'label color check' do
      expect(label.color).to eq 'blue'
    end
    it 'check add_item method in the Label class' do
      expect(label.items.length).to eq 1
    end
  end
end
