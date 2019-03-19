require_relative './collection'

class Parser
  RECOGNIZED_COMMANDS = [
                          'add',
                          'play',
                          'show_all',
                          'show_unplayed',
                          'show_all_by',
                          'show_unplayed_by'
                        ]

  UnknownCommandError   = Class.new(StandardError)

  attr_reader :command, :args

  def initialize(str)
    @buffer = StringScanner.new str
    @command = ''
    @args = []
    parse
  end

  def execute
    if RECOGNIZED_COMMANDS.include? @command
      send(@command, @args)
    else
      binding.pry
      raise UnknownCommandError
    end
  end

  private

  def parse
    until @buffer.eos?
      parse_input
    end
  end

  def parse_input
    unless @buffer.exist? /"/
      @command = @buffer.string.gsub(' ', '_') and @buffer.terminate
    else
      command = @buffer.scan_until /"/
      @command = command.delete_suffix(' "').gsub(' ', '_')

      @buffer.pos = @buffer.pos - 1

      args_with_quotes = []
      until @buffer.eos?
        args_with_quotes << @buffer.scan(/"([^"]*)"/)
        @buffer.skip(/\s+/)
        @args = args_with_quotes.map { |arg| arg.delete_prefix('"').delete_suffix('"') }
      end
    end
  end

  def add(args_arr)
    $collection.add_album(args_arr)
  end

  def play(args_arr)
    $collection.play_album(args_arr[0])
  end

  def show_all(_args)
    $collection.show_all
  end

  def show_unplayed(_args)
    $collection.show_unplayed
  end

  def show_all_by(args_arr)
    $collection.show_all_by(args_arr[0])
  end

  def show_unplayed_by(args_arr)
    $collection.show_unplayed_by(args_arr[0])
  end
end
