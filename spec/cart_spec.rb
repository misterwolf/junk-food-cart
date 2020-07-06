require './lib/cart'
require './lib/product/food/hamburger'

describe Cart do
  describe '.count' do
    before do
      Cart.new
    end

    it 'counts all instances' do
      expect(Cart.count).to eq(1)
    end
  end

  describe '#progressive' do
    before do
      @cart = Cart.new
    end

    it 'returns the last created instance number' do
      expect(@cart.progressive).to eq(Cart.count)
    end
  end

  describe '#add_product' do
    before do
      @hamburger = Hamburger.new
      @cart = Cart.new(@hamburger)
    end

    it 'adds product in the list keeping the already existing' do
      @hamburger2 = Hamburger.new

      @cart.add_products(@hamburger2)

      expect(@cart.cart_products).to eq([@hamburger, @hamburger2])
    end
  end
end
