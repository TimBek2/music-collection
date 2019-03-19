require 'pry'

class Parser
  attr_reader :command, :args

  def initialize(str)
    @buffer = StringScanner.new str
    @command = ''
    @args = []
    parse
  end

  def parse
    until @buffer.eos?
      parse_input
    end
  end

  def parse_input
    @command = @buffer.string unless @buffer.exist? /"/

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
