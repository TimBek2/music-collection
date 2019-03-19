require_relative './album'
require_relative './parser'
require_relative './collection'

class Music
  def run
    @running = true

    puts 'Welcome to your music library!'
    puts 'What would you like to do?'

    while @running
      $collection = Collection.new

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
    command = Parser.new(input)
    binding.pry
    puts command.execute

  rescue ArgumentError
    show_invalid_arguments_message
  rescue Parser::UnknownCommand
    show_unrecognized_message
  end

  def show_unrecognized_message
    puts "That's not a valid command. Type help to see your options"
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
      quit                          Exits the application.'
    HELP
  end
end
