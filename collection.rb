class Collection
  attr_reader :all_albums, :unplayed_albums, :played_albums

  def initialize
    @all_albums = []
    @unplayed_albums = []
    @played_albums = []
  end

  def add_album album
    @all_albums << album
    @unplayed_albums << album
  end

  def play_album album_title
    album = @all_albums.find { |a| a.title == album_title }
    @unplayed_albums - [album]
    @played_albums + [album]
    album.play_album
  end
end
