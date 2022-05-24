class MusicAlbumController
  def initialize()
    @music_albums = []
  end

  def list
    if @music_albums.length.zero?
      puts ' Music albums list is empty! choose the option to add a new album from the list'
    else
      @music_albums.each_with_index do |album, index|
        puts "- Album #{index + 1} : #{album.publish_date}"
      end
    end
  end

  def add(publish_date, on_spotify)
    @music_albums.push(MusicAlbum.new(publish_date, on_spotify))
  end
end
