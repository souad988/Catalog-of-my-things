require_relative '../classes/music_album'
require_relative '../classes/item'
require 'date'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new '2021-05-20', 'true', 972
    @json = '{"id":972,"publish_date":"2021-05-20","on_spotify":"true","genre":null,"archived":false}'
  end

  it 'should be a MusicAlbum instance ' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'music_album publish_date shoud equal 2021-05-20 ' do
    expect(@music_album.publish_date).to eql Date.parse('2021-05-20')
  end

  it 'music_album on_spotify should be true' do
    expect(@music_album.on_spotify).to be_truthy
  end

  it 'music album genre to be nil' do
    expect(@music_album.genre).to be_nil
  end

  it 'from_json converts properly json object to MusicAlbum instance' do
    expect(MusicAlbum.from_json(@json)).to be_instance_of MusicAlbum
  end

  it 'to_json generates json object ' do
    expect(@music_album.to_json).to eql @json
  end
end
