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
end
