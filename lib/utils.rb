# Utils class
# introduce some facilities.
module Utils
  # If "float" is used for arithmetic operations this problem can occur: https://0.30000000000000004.com
  # In order to avoid this problem, it is better to define the number
  # multiplied by 1000 and present it on the screen by dividing by 100 and
  # truncating to have a maximum of two decimal places
  def round(num)
    format('%.2f', (num)).to_f
  end

  # it calculates the percent of num with the passed percetage.
  # Method result should be added to the original number
  def percent_of(num, percent)
    (round(num) * percent) / 100
  end

  # In order to avoid to use the euro char each time it is needed in a string
  def to_euro(num)
    "#{num}€"
  end
end
