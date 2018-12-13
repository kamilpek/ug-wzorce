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
    billingObserver = Billing.new
    # przychodzące
    incCall = callFactory.make_call("incoming", "501200123", "585232100")
    incCall.prepare(alcatelOmni)
    incCall.calling
    incCall.attachObserver(billingObserver)
    incCall.notifyObserver
    # wychodzące na numery premium
    outPremiumCall = callFactory.make_call("outgoing", "585232100", "501200123")
    outPremiumCall.prepare(alcatel4400)
    premiumCall = PremiumCall.new(outPremiumCall)
    premiumCall.calling
    outPremiumCall.attachObserver(billingObserver)
    outPremiumCall.notifyObserver
    # wychodzące za granicę
    outForeignCall = callFactory.make_call("outgoing", "585232100", "0074952311500")
    outForeignCall.prepare(alcatel4400)
    foreignCostCall = PremiumCall.new(outForeignCall)
    foreignCall = ForeignCall.new(foreignCostCall)
    foreignCall.zvonit
    outForeignCall.attachObserver(billingObserver)
    outForeignCall.notifyObserver
  end
end

main = Main.new
