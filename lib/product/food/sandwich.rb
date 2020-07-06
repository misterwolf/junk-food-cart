require_relative 'food_base'

# Sandwich Class
# it contains methods that define the specific product
class Sandwich < FoodBase
  # Type definition. Generally the name of the class
  def type
    :sandwich
  end

  # Specific price of the product
  def price
    5.0
  end

  # Description, using also the parent description.
  def description
    "#{super} - Tramezzino"
  end
end
