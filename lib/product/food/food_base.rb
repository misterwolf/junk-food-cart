require_relative '../product_base'

class FoodBase < ProductBase
  def tax
    1000
  end

  def description
    'Panino'
  end
end
