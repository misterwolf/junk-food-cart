require './lib/product/food/hamburger'

describe Hamburger do
  it { expect(described_class).to be < FoodBase }

  before do
    @base = described_class.new
  end

  it 'price is 10' do
    expect(@base.price).to eq(10)
  end

  it "descriptions is 'Panino - Hamburger'" do
    expect(@base.description).to eq('Panino - Hamburger')
  end
end
