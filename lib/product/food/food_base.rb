require_relative '../product_base'

class FoodBase < ProductBase
  def tax
    10.0
  end

  def description
    'Panino'
  end
end
