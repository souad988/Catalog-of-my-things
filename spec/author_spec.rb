require_relative '../classes/author'

require 'yaml'

describe Author do
  before :each do
    @author = Author.new 'Jerry', 'Owusu'
  end

  it '@author should be an instance of Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'author first name to be "Jerry"' do
    @first_name == 'Jerry'
  end

  it 'author last name to be "Owusu"' do
    @last_name == 'Owusu'
  end
end
