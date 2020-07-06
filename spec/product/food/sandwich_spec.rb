require './lib/product/food/sandwich'

describe Sandwich do
  it { expect(described_class).to be < FoodBase }

  before do
    @base = described_class.new
  end

  it 'price is 5.0' do
    expect(@base.price).to eq(5.0)
  end

  # ofc, we need to introduce some translations.
  it "descriptions is 'Panino - Tramezzino'" do
    expect(@base.description).to eq('Panino - Tramezzino')
  end
end
