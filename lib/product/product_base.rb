require_relative '../utils'

# ProductBase.
# Definitions for the a product purchaseble at the shop. It contains the
# common methods
class ProductBase
  include Utils

  # Tax evaluation for the product price, defined in the child class
  def tax_evaluation
    percent_of(price, tax)
  end

  # Return the "Price + Tax" evaluation, "price" defined in the child class
  def full_price
    price + tax_evaluation
  end
end
