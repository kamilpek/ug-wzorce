require_relative 'call'
class CallFactory
  def make_call(type)
    case type
    when 'internal' then InternalCall.new
    when 'outgoing' then OutgoingCall.new
    when 'incoming' then IncomingCall.new
    end
  end
end

class InternalCall < Call
  def initialize
    @@parameters["direction"] = "WEWNĘTRZNE"
    @@parameters["caller"] = "2100"
    @@parameters["recipient"] = "2266"
    @@parameters
  end

  def calling
    self.dial
    self.ring
    self.reject
  end
end

class OutgoingCall < Call
  def initialize
    @@parameters["direction"] = "WYCHODZĄCE"
    @@parameters["caller"] = "585232100"
    @@parameters["recipient"] = "501200123"
    @@parameters
  end
end

class IncomingCall < Call
  def initialize
    @@parameters["direction"] = "PRZYCHODZĄCE"
    @@parameters["recipient"] = "585232100"
    @@parameters["caller"] = "501200123"
    @@parameters
  end

  def calling
    self.recipRing
    self.recipAnswer
    self.callerAnswer
    self.reject
  end
end
