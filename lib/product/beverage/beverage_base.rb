require_relative '../product_base'

class BeverageBase < ProductBase
  def type
    :beverage
  end

  def tax
    15.0
  end

  def description
    'Bibita'
  end
end
