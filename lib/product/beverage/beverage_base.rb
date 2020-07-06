require_relative '../product_base'

# FoodBase.
# Category "Beverage" definition. It contains the common methods
class BeverageBase < ProductBase
  # Tax applied to Product category
  def tax
    1500
  end

  # Description of this specific Product category
  def description
    'Bibita'
  end
end
