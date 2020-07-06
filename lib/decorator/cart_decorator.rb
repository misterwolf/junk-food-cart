require './lib/utils/to_euro'

class CartDecorator
  CHECK_TAX_EVALUATION = true # Not used atm. We can skip the "IVA discount" by disabling it. Better set similar constant in the DB.
  EVALUATE_TAX_AT = 30.0

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

    return [total, 0, total] if total >= EVALUATE_TAX_AT

    [total, total_cost_tax, total_cost_full_price]
  end

  def sort_cart_products
    products.compact.group_by do |p|
      p.type
    end
  end

  def checkout
    prepare_receipt
  end

  private

  def prepare_receipt
    <<~HERE
    #{line}
    #{cart_number}
    #{line}
    #{print_products}

    #{recap}
    HERE
  end

  def line
    "————————————————————————————————————————————————————"
  end

  def cart_number
    "Cestino #{progressive}"
  end

  def print_products
    sort_cart_products.each_with_index.collect do |product_line, index|
      how_much = product_line[1].size
      p = product_line[1].first

      "#{index+1} | #{p.description} | #{how_much} |  #{p.price.to_euro} | #{(p.price * how_much).to_euro} | #{(p.tax_evaluation * how_much).to_euro} | #{(p.full_price * how_much).to_euro}"
    end.join("\n")
  end

  def recap
    tax_free, tax_cost, total_cost = evaluate_total_costs

    <<~HERE
    #{line}
    Totale (senza iva): #{tax_free.to_euro}
    Iva applicata: #{tax_cost.to_euro}
    Totale (iva inclusa): #{total_cost.to_euro}
    #{line}
    HERE
  end
end
