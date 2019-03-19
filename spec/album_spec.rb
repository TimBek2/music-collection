require_relative '../album'

describe Album do
  let (:album) { Album.new('Album Title', 'Tim') }

  it 'returns the title' do
    expect(album.title).to eql('Album Title')
  end

  it 'returns the artist' do
    expect(album.artist).to eql('Tim')
  end

  it 'initializes as unplayed' do
    expect(album.played?).to eql(false)
  end

  it 'becomes marked as played once it is played' do
    album.play_album

    expect(album.played?).to eql(true)
  end
end
