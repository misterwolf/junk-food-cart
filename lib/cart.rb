# Cart Class.
# The container of all products.
class Cart
  @how_many_carts = 0

  class << self
    # Number of Cart instance creates
    def count
      @how_many_carts
    end

    # Increment the number of the Cart instance creates
    def increment_instance_carts
      @how_many_carts += 1
    end
  end

  attr_reader :cart_products, :progressive

  def initialize(products = nil)
    self.class.increment_instance_carts
    @progressive = self.class.count

    (@cart_products = [products].compact).flatten!
  end

  # Add products to the cart
  # param: products
  # => possible type are:
  #   => Array of [<ProductInstance>, .., ..]
  #   => <ProductInstance>
  # Returns the current product list
  # Examples
  #
  #   cart.add_products(Sandwich.new)
  #   # => 'TomTomTomTom'
  #
  def add_products(products)
    # remove nil element and save bidimensional array.
    (@cart_products << [products].compact).flatten!
  end

  # future purpose!
  # def remove_product(product)
  #   products << product
  # end
end
