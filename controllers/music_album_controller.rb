class MusicAlbumController
  def initialize()
    @music_albums = Query.read('music_album').map { |json| MusicAlbum.from_json(json) }
  end

  def list
    if @music_albums.length.zero?
      puts ' Music albums list is empty! choose the option to add a new album from the list'
    else
      @music_albums.each_with_index do |album, index|
        puts "- Album #{index + 1} publish_date: #{album.publish_date} on_spotify: #{album.on_spotify}"
      end
      puts ''
    end
  end

  def add(publish_date, on_spotify , genre)
    music_album = MusicAlbum.new(publish_date, on_spotify.downcase == 'y' ? true : false)
    music_album.add_genre(genre)
    @music_albums.push(music_album)
  end

  def save
    serialized_data = @music_albums.map(&:to_json)
    Query.write('music_album',JSON.generate(serialized_data))
  end
end