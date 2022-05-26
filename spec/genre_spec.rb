require_relative '../genre'
require 'date'
require 'json'

describe Genre do
  before :each do
    @genre = Genre.new 'Art', 972
    @json = "{\"id\":972,\"name\":\"Art\"}"
  end

  it 'should be a Genre instance ' do
    expect(@genre).to be_instance_of Genre
  end

  it 'genre name shoud equal Art ' do
    expect(@genre.name).to eql 'Art'
  end

  it 'genre id should equal 972' do
    expect(@genre.id).to eql 972
  end

  it 'from_json converts properly json object to Genre instance' do
    expect(Genre.from_json(@json)).to be_instance_of Genre
  end

  it 'to_json generates json object ' do
    expect(@genre.to_json).to eql @json
  end
end
