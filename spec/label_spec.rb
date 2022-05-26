require_relative '../classes/label'

describe Label do
  context 'When testing the Label class' do
    label = Label.new('label_title', 'label_color')
    it 'label instance should return attributes it was created with' do
      expect(label.title).to eq 'label_title'
      expect(label.color).to eq 'label_color'
    end
  end
end
