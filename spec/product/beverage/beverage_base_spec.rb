require './lib/product/beverage/beverage_base'

describe BeverageBase do
  it { expect(described_class).to be < ProductBase }

  before do
    @base = described_class.new
  end

  it 'tax is 15.0' do
    expect(@base.tax).to eq(15.0)
  end

  it 'descriptions is Bibita' do
    expect(@base.description).to eq('Bibita')
  end
end
