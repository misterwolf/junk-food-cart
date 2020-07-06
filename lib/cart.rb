class Cart
  @@how_many_carts = 0

  def self.count
    @@how_many_carts
  end

  attr_reader :cart_products, :progressive

  def initialize(products = nil)
    @@how_many_carts += 1
    @progressive = @@how_many_carts

    (@cart_products = [products].compact).flatten!
  end

  def add_products(products)
    (@cart_products << [products].compact).flatten!
  end

  # future purpose!
  # def remove_product(product)
  #   products << product
  # end
end
