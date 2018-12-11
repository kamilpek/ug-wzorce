class PremiumCall
  def initialize(call)
    @call = call
  end

  def cost
    @call["cost"] = @call["cost"] + 10
  end

  def calling
    puts "--- POŁĄCZENIE PREMIUM ---"
    @call.calling
  end
end
