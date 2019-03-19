def Parser
  def initialize(str)
    @buffer = StringScanner.new(str)
    parse
  end
end
