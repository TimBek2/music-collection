require_relative '../parser'

describe Parser do
  let(:parser) { Parser.new 'add "ride the lightning" "metallica"' }

  it 'correctly finds the command from a string' do
    expect(parser.command).to eql('add')
  end

  it 'correctly finds the arguments from the string' do
    expect(parser.args).to include('ride the lightning', 'metallica')
  end
end
