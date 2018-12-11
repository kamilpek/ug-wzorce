class Call
  @@parameters = Hash.new

  def []=(*args)
    @@parameters[args[0]] = args[1]
  end

  def prepare(pbx)
    puts("\n")
    puts("--- Uruchamianie połączenia: #{@@parameters["direction"]} ---")
    puts("--- Centrala obsługująca połączenie: #{pbx.getModel} ---")
    puts("--- Abonent: #{@@parameters["caller"]} --- Numer wywoływany: #{@@parameters["recipient"]} ---")
  end

  def calling
    self.dial
    self.ring
    self.recipAnswer
    self.callerAnswer
    self.recipReply
    self.ending
  end

  def dial
    puts("[C] trwa zestawianie połączenia...")
  end

  def ring
    puts("[C] ring ding ding")
  end

  def recipRing
    puts("[R] ding ring ding")
  end

  def recipAnswer
    puts("[R] HALO, SŁUCHAM!")
  end

  def callerAnswer
    puts("[C] DZWONIĘ DO PANA W BARDZO NIETYPOWEJ SPRAWIE...")
  end

  def recipReply
    puts("[R] DZIĘKUJĘ BARDZO, ALE NIE SKORZYSTAM.")
  end

  def reject
    puts("[R] pip pip pip")
  end

  def ending
    puts("[R] clank")
  end
end
