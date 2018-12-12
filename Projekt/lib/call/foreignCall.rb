class ForeignCall
  def initialize(adapter)
    @adapter = adapter
  end

  def zvonit
    @adapter.calling
  end
end
