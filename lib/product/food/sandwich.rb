require_relative 'food_base'

class Sandwich < FoodBase
  def type
    :sandwich
  end

  def price
    5.0
  end

  def description
    "#{super} - Tramezzino"
  end
end