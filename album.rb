require 'pry'

class Album
  attr_reader :title, :artist, :played

  def initialize title, artist
    @title = title
    @artist = artist
    @played = false
  end

  def play_album(collection=$collection)
    @played = true
    binding.pry
    collection.play_album self
  end

  def played?
    @played
  end
end
