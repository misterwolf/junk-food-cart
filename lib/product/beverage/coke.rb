require_relative 'beverage_base'

# Coke Class
# it contains methods that define the specific product
class Coke < BeverageBase
  # Type definition. Generally the name of the class
  def type
    :coke
  end

  # Specific price of the product
  def price
    300
  end

  # Description, using also the parent description.
  def description
    "#{super} - CocaCola"
  end
end
