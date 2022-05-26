require_relative '../classes/label'

describe Label do
  context 'When testing the Label class' do
    label = Label.new('label_title', 'blue')
    it 'label title check' do
      expect(label.title).to eq 'label_title'
    end
    it 'label color check' do
      expect(label.color).to eq 'blue'
    end
  end
end
