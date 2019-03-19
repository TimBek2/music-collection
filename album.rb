class Album
  attr_reader :title, :artist, :played

  def initialize title, artist
    @title = title
    @artist = artist
    @played = false
  end

  def play_album
    @played = true
    $collection.play_album self
  end

  def played?
    @played
  end
end
