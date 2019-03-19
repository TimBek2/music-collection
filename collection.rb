class Collection
  attr_reader :all_albums, :unplayed_albums, :played_albums

  UnknownAlbumError  = Class.new(StandardError)
  NoValidAlbumsError = Class.new(StandardError)

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
    if @all_albums.length == 0
      raise NoValidAlbumsError
    else
      @all_albums.length.times do |i|
        puts "\"#{@all_albums[i].title}\" by #{@all_albums[i].artist} (#{@all_albums[i].played_text})"
      end
    end
  end

  def show_unplayed
    if @unplayed_albums.length == 0
      raise NoValidAlbumsError
    else
      @unplayed_albums.length.times do |i|
        puts "\"#{@unplayed_albums[i].title}\" by #{@unplayed_albums[i].artist}"
      end
    end
  end

  def show_all_by artist_name
    artist_albums = @all_albums.select { |album| album.artist == artist_name }
    if artist_albums.length == 0
      raise NoValidAlbumsError
    else
      artist_albums.length.times do |i|
        puts "\"#{artist_albums[i].title}\" by #{artist_albums[i].artist} (#{artist_albums[i].played_text})"
      end
    end
  end
end
