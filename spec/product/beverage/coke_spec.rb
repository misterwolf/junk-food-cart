require './lib/product/beverage/coke'

describe Coke do
  it { expect(described_class).to be < BeverageBase }

  before do
    @base = described_class.new
  end

  it 'price is 3.0' do
    expect(@base.price).to eq(3.0)
  end

  it 'descriptions is Bibita' do
    expect(@base.description).to eq('Bibita - CocaCola')
  end
end
