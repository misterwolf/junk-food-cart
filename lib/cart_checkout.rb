require_relative './utils'
require_relative './string_utils'
require_relative './bigdecimal_utils'

class CartCheckout
  include Utils
  using StringUtils
  using BigDecimalUtils

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

    return [total, BigDecimal('0.0'), total] if total >= FREE_TAX_THRESHOLD

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
    unit_price = p.price
    no_tax = unit_price * how_much
    tax_applied = p.tax_evaluation * how_much
    full_price = p.full_price * how_much

    [cart_progressive,
      p.description,
      how_much,
      unit_price.two_decimal.add_euro_sym,
      no_tax.two_decimal.add_euro_sym,
      tax_applied.two_decimal.add_euro_sym,
      full_price.two_decimal.add_euro_sym
    ].join(' | ')
    end.join("\n")
  end

  def recap
    tax_free, tax_cost, total_cost = evaluate_total_costs

    <<~HERE
    #{line}
    Totale (senza iva): #{tax_free.two_decimal.add_euro_sym}
    Iva applicata: #{tax_cost.two_decimal.add_euro_sym}
    Totale (iva inclusa): #{total_cost.two_decimal.add_euro_sym}
    #{line}
    HERE
  end
end
