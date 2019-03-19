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
        puts "here's the options:"

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
