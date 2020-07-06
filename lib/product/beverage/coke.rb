require_relative 'beverage_base'

class Coke < BeverageBase
  def type
    :coke
  end

  def price
    300
  end

  def description
    "#{super} - CocaCola"
  end
end
