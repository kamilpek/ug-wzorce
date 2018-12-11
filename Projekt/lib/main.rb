require_relative 'requires'
class Main
  def initialize
    # centrale
    director = Director.new
    alcatel4400 = director.pbx(Alcatel4400Builder.new).getPbx
    director.build
    alcatelOmni = director.pbx(AlcatelOmniBuilder.new).getPbx
    director.build
    # połączenia
    callFactory = CallFactory.new
    # przychodzące
    incCall = callFactory.make_call("incoming")
    incCall.prepare(alcatelOmni)
    incCall.calling
    # wychodzące na numery premium
    outPremiumCall = callFactory.make_call("outgoing")
    outPremiumCall.prepare(alcatel4400)
    premiumCall = PremiumCall.new(outPremiumCall)
    premiumCall.calling
  end
end

main = Main.new
