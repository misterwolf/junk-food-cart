require './lib/cart_checkout'
require './lib/cart'
require './lib/product/beverage/coke'
require './lib/product/food/hamburger'
require './lib/product/food/sandwich'

describe CartCheckout do
  before do
    @hamburger = Hamburger.new
    @coke = Coke.new
    @sandwich = Sandwich.new
    @cart = Cart.new
  end

  subject { CartCheckout.new(@cart) }

  describe '#total_cost_tax_free' do
    context '1 item' do
      before do
        @cart.add_products([@hamburger])
      end

      it 'returns cost' do
        expect(subject.total_cost_tax_free).to eq(@hamburger.price)
      end
    end

    context 'more items' do
      before do
        @cart.add_products([@hamburger, @coke])
      end

      it 'returns summed cost' do
        expect(subject.total_cost_tax_free).to eq(@hamburger.price + @coke.price)
      end
    end
  end

  describe '#total_cost_tax' do
    context '1 item' do
      before do
        @cart.add_products([@hamburger])
      end

      it 'returns cost' do
        expect(subject.total_cost_tax).to eq(@hamburger.tax_evaluation)
      end
    end

    context 'more items' do
      before do
        @cart.add_products([@hamburger, @coke])
      end

      it 'returns summed cost' do
        expect(subject.total_cost_tax).to eq(@hamburger.tax_evaluation + @coke.tax_evaluation)
      end
    end
  end

  describe '#evaluate_total_costs' do
    it 'returns all costs' do
      allow(subject).to receive(:total_cost_tax_free).and_return(1)

      expect(subject.evaluate_total_costs).to eq([
        subject.total_cost_tax_free,
        subject.total_cost_tax,
        subject.total_cost_full_price
        ]
      )
    end

    context 'total_cost_tax_free > FREE_TAX_THRESHOLD' do
      it 'returns all costs without tax evaluation' do
        allow(subject).to receive(:total_cost_tax_free).and_return(CartCheckout::FREE_TAX_THRESHOLD + 1)

        expect(subject.evaluate_total_costs).to eq([
          subject.total_cost_tax_free,
          0,
          subject.total_cost_tax_free
          ]
        )
      end
    end
  end

  describe '#sort_cart_products' do
    before do
      @hamburger = Hamburger.new
      @coke = Coke.new
      @sandwich = Sandwich.new
      @cart = Cart.new([@hamburger, @hamburger2, @coke, @sandwich])
    end

    it 'makes hash with sorted type' do
      expect(subject.sort_cart_products).to include(@hamburger.type, @hamburger.type, @sandwich.type)
    end


    context 'duplicated products' do
      it 'makes hash without duplicates types' do
        @hamburger2 = Hamburger.new
        @cart = Cart.new([@hamburger, @hamburger2, @coke, @sandwich])

        sorted_products = subject.sort_cart_products

        expect(sorted_products).to include(@hamburger.type, @hamburger.type, @sandwich.type)
        expect(sorted_products.dig(@hamburger.type)).to include(@hamburger, @hamburger2)
      end
    end
  end

  describe 'checkout' do
    before do
      @cart = Cart.new
    end

    it 'prints the products' do
      @cart.add_products([@hamburger])

      expectation = <<~HERE
      ————————————————————————————————————————————————————
      Cestino #{@cart.progressive}
      ————————————————————————————————————————————————————
      1 | Panino - Hamburger | 1 | 10.00€ | 10.00€ | 1.00€ | 11.00€

      ————————————————————————————————————————————————————
      Totale (senza iva): 10.00€
      Iva applicata: 1.00€
      Totale (iva inclusa): 11.00€
      ————————————————————————————————————————————————————
      HERE

      expect(subject.checkout.strip).to eq(expectation.strip)
    end

    it 'two similar products' do
      @cart.add_products([@hamburger, @hamburger])

      expectation = <<~HERE
      ————————————————————————————————————————————————————
      Cestino #{@cart.progressive}
      ————————————————————————————————————————————————————
      1 | Panino - Hamburger | 2 | 10.00€ | 20.00€ | 2.00€ | 22.00€

      ————————————————————————————————————————————————————
      Totale (senza iva): 20.00€
      Iva applicata: 2.00€
      Totale (iva inclusa): 22.00€
      ————————————————————————————————————————————————————
      HERE

      expect(subject.checkout.strip).to eq(expectation.strip)
    end

    it 'two different products' do
      @cart.add_products([@hamburger])
      @cart.add_products([@sandwich])

      expectation = <<~HERE
      ————————————————————————————————————————————————————
      Cestino #{@cart.progressive}
      ————————————————————————————————————————————————————
      1 | Panino - Hamburger | 1 | 10.00€ | 10.00€ | 1.00€ | 11.00€
      2 | Panino - Tramezzino | 1 | 5.00€ | 5.00€ | 0.50€ | 5.50€

      ————————————————————————————————————————————————————
      Totale (senza iva): 15.00€
      Iva applicata: 1.50€
      Totale (iva inclusa): 16.50€
      ————————————————————————————————————————————————————
      HERE

      expect(subject.checkout.strip).to eq(expectation.strip)
    end
  end
end
