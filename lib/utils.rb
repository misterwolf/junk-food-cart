# Utils class
# introduce some facilities.
module Utils
  # it calculates the percent of num with the passed percetage.
  # Method result should be added to the original number
  def percent_of(num, percent)
    (num * percent) / BigDecimal('100')
  end
end
