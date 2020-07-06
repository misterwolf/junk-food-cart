require_relative '../utils'

class ProductBase
  include Utils

  def tax_evaluation
    percent_of(price, tax)
  end

  def full_price
    price + tax_evaluation
  end
end
