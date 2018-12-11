class premiumAdapter
  def initialize
  end

  def prepare(pbx)
    puts("\n")
    puts("--- Uruchamianie połączenia wychodzącego na numery premium ---")
    puts("--- Centrala obsługująca połączenie: #{pbx.getModel} ---")
    puts("--- Abonent: #{@@parameters["caller"]} --- Numer wywoływany: #{@@parameters["recipient"]} ---")
  end
end
