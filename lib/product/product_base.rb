require_relative '../utils/percent_of'

class ProductBase
  def tax_evaluation
    (price).percent_of(tax)
  end

  def full_price
    price + tax_evaluation
  end
end
