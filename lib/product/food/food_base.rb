require_relative '../product_base'

# FoodBase.
# Category "Food" definition. It contains the common methods
class FoodBase < ProductBase
  # Tax applied to Product category
  def tax
    BigDecimal('10.0')
  end

  # Description of this specific Product category
  def description
    'Panino'
  end
end
