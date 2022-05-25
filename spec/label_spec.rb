require './label'
require './item'

describe Label do
  context 'When testing the Label class' do
    label = Label.new('title', 'color')
    item = Item.new()
    label.add_item(item)
    it 'label instance should return attributes it was created with' do
      expect(label.title).to eq 'title'
      expect(label.color).to eq 'color'
      expect(label.items[0]) to eq item
    end
  end
end