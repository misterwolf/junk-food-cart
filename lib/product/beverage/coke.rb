require_relative 'beverage_base'

class Coke < BeverageBase
  def type
    :coke
  end

  def price
    3.0
  end

  def description
    "#{super} - CocaCola"
  end
end
