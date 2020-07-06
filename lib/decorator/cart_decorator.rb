require_relative '../utils'

class CartDecorator
  include Utils

  CHECK_TAX_EVALUATION = true # Not used atm. We can skip the "IVA discount" by disabling it. Better set similar constant in the DB.
  FREE_TAX_THRESHOLD = 30

  PRODUCT_TYPES = {
    food: [
      :hamburger,
      :sandwich
    ],
    beverage: [
      :coke
    ]
  }

  attr_reader :products, :progressive

  def initialize(cart)
    @progressive = cart.progressive
    @products = cart.cart_products || []
  end

  def total_cost_tax_free
    products.sum(&:price)
  end

  def total_cost_tax
    products.sum(&:tax_evaluation)
  end

  def total_cost_full_price
    products.sum(&:full_price)
  end

  def evaluate_total_costs
    total = total_cost_tax_free

    return [total, 0, total] if total >= FREE_TAX_THRESHOLD

    [total, total_cost_tax, total_cost_full_price]
  end

  def sort_cart_products
    products.compact.group_by(&:type)
  end

  def checkout
    prepare_receipt
  end

  private

  def prepare_receipt
    receipt = <<~HERE
    #{line}
    #{cart_number}
    #{line}
    #{print_products}

    #{recap}
    HERE

    receipt
  end

  def line
    "————————————————————————————————————————————————————"
  end

  def cart_number
    "Cestino #{progressive}"
  end

  def print_products
    sort_cart_products.each_with_index.collect do |product_line, index|
      cart_progressive = index + 1
      how_much = product_line[1].size
      p = product_line[1].first
      unit_price = round(p.price)
      no_tax = unit_price * how_much
      tax_applied = round(p.tax_evaluation * how_much)
      full_price = round(p.full_price * how_much)

      [cart_progressive, p.description, how_much, to_euro(unit_price), to_euro(no_tax), to_euro(tax_applied), to_euro(full_price)].join(' | ')
    end.join("\n")
  end

  def recap

    tax_free, tax_cost, total_cost = evaluate_total_costs

    <<~HERE
    #{line}
    Totale (senza iva): #{to_euro(tax_free)}
    Iva applicata: #{to_euro(tax_cost)}
    Totale (iva inclusa): #{to_euro(total_cost)}
    #{line}
    HERE
  end
end
