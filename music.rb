require_relative './album'
require_relative './parser'
require_relative './collection'

class Music
  def run
    @running = true
    $collection = Collection.new

    puts 'Welcome to your music library!'
    puts 'What would you like to do?'

    while @running
      print "> "
      input = gets.chomp

      case input
      when 'quit'
        quit

      when 'help'
        show_help_message

      else
        execute(input)
      end
    end
  end

  private

  def quit
    puts 'Goodbye!'
    @running = false
  end

  def execute(input)
    begin
    command = Parser.new(input)
    puts command.execute

    rescue ArgumentError
      show_invalid_arguments_message
    rescue Parser::UnknownCommandError
      show_unrecognized_command_message
    rescue Collection::UnknownAlbumError
      show_unrecognized_album_message
    rescue Collection::NoValidAlbumsError
      show_no_albums_message
    rescue Collection::AlbumAlreadyExistsError
      show_album_already_exists_message
    end
  end

  def show_unrecognized_command_message
    puts "That's not a valid command. Type help to see your options"
  end

  def show_invalid_arguments_message
    puts "That command was not formatted correctly. Type help to see your options (parts after the $ should be replaced with values you want)"
  end

  def show_unrecognized_album_message
    puts "You haven't added that album yet. Type help to see your options (you should add some albums)"
  end

  def show_no_albums_message
    puts "Nothing to show! Type help to see your options (you should add some albums)"
  end

  def show_album_already_exists_message
    puts "An album by that name already exists. This system currently cannot hold two albums with the same title"
  end

  def show_help_message
    puts <<~HELP
      help                          Shows this help message
      add "$Album Title" "$Artist"  Add an album to your library
      play "$Album Title"           Marks that album as "played"
      show all                      Show a list of all albums and whether they've been played
      show unplayed                 Show a list of only unplayed albums
      show all by "$Artist"         Show a list of all albums by an artist
      show unplayed by "$Artist"    Show a list of only unplayed albums by an artist
      quit                          Exits the application.
    HELP
  end
end
