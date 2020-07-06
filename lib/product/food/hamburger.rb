require_relative 'food_base'

class Hamburger < FoodBase
  def type
    :hamburger
  end

  def price
    10.0
  end

  def description
    "#{super} - Hamburger"
  end
end
