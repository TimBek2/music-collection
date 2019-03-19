require_relative '../collection'

describe Collection do
  let(:collection) { Collection.new }

  it 'contains an array for all albums to be included in' do
    expect(collection.all_albums).to eql([])
  end

  it 'contains an array for unplayed albums to be included in' do
    expect(collection.unplayed_albums).to eql([])
  end

  it 'contains an array for played albums to be included in' do
    expect(collection.played_albums).to eql([])
  end

  context 'add an album' do
    let(:album) { Album.new('Collection Album Title', 'Tim') }

    it 'can add an album to the collection' do
      collection.add_album album

      expect(collection.all_albums).to include(album)
    end
  end
end
