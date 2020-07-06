require_relative './lib/cart'
require_relative './lib/decorator/cart_decorator'
require_relative './lib/product/beverage/coke'
require_relative './lib/product/food/hamburger'
require_relative './lib/product/food/sandwich'

module Example
  class SomeCarts
    examples = [
      [
        hamburger: 1,
        sandwich: 3,
        coke: 4
      ],
      [
        hamburger: 12
      ],
      [
        hamburger: 1,
        coke: 2
      ],
      [
        hamburger: 1,
        coke: 1
      ]
    ]

    examples.each do |example, key|
      cart = Cart.new

      example.each do |product, how_much|
        (1..how_much).each do
          cart.add_products(eval("::#{product.to_s.capitalize}.new"))
        end
      end

      cart_decorator = CartDecorator.new(cart)
      puts cart_decorator.checkout
    end
  end
end
