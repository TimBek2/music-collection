class Collection
  attr_reader :all_albums, :unplayed_albums, :played_albums

  UnknownAlbumError = Class.new(StandardError)

  def initialize
    @all_albums = []
    @unplayed_albums = []
    @played_albums = []
  end

  def add_album album
    @all_albums << album
    @unplayed_albums << album
    puts "Added \"#{album.title}\" by #{album.artist}"
  end

  def play_album album_title
    album = @all_albums.find { |a| a.title == album_title }
    if album.nil?
      raise UnknownAlbumError
    else
      @unplayed_albums -= [album]
      @played_albums += [album]
      album.play_album
    end
  end

  def show_all
    @all_albums.each do |album|
      puts "\"#{album.title}\" by #{album.artist} (#{album.played_text})"
    end
  end

  def show_unplayed
    @unplayed_albums.each do |album|
      puts "\"#{album.title}\" by #{album.artist}"
    end
  end
end
