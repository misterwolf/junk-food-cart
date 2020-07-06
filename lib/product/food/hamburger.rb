require_relative 'food_base'

# Hamburger Class
# it contains methods that define the specific product
class Hamburger < FoodBase
  # Type definition. Generally the name of the class
  def type
    :hamburger
  end

  # Specific price of the product
  def price
    1000
  end

  # Description, using also the parent description.
  # eg: Panino - Hamburger
  def description
    "#{super} - Hamburger"
  end
end
