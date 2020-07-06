module Utils
  def round(n)
    format('%.2f', (n / 100.0)).to_f
  end

  def percent_of(n, percent)
    (round(n) * percent) / 100
  end

  def to_euro(n)
    "#{n.to_s}€"
  end
end
