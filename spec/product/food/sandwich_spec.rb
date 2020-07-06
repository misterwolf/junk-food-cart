require './lib/product/food/sandwich'

describe Sandwich do
  it { expect(described_class).to be < FoodBase }

  before do
    @base = described_class.new
  end

  it 'price is 500' do
    expect(@base.price).to eq(500)
  end

  # ofc, we need to introduce some translations.
  it "descriptions is 'Panino - Tramezzino'" do
    expect(@base.description).to eq('Panino - Tramezzino')
  end
end
