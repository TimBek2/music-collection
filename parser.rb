require 'pry'

class Parser
  RECOGNIZED_COMMANDS = [
                          'add',
                          'play',
                          'show all',
                          'show unplayed',
                          'show all by',
                          'show unplayed by'
                        ]

  UnknownCommand      = Class.new(StandardError)

  attr_reader :command, :args

  def initialize(str)
    @buffer = StringScanner.new str
    @command = ''
    @args = []
    parse
  end

  def execute
    if RECOGNIZED_COMMANDS.include? @command
      binding.pry
      send(@command, @args)
    else
      raise UnknownCommand
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
      @command = @buffer.string and @buffer.terminate
    else
      command = @buffer.scan_until /"/
      @command = command.delete_suffix(' "')

      @buffer.pos = @buffer.pos - 1

      args_with_quotes = []
      until @buffer.eos?
        args_with_quotes << @buffer.scan(/"([^"]*)"/)
        @buffer.skip(/\s+/)
        @args = args_with_quotes.map { |arg| arg.delete_prefix('"').delete_suffix('"') }
      end
    end
  end

  def add
    # in the add method
    binding.pry
  end
end
