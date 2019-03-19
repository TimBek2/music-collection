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
end
