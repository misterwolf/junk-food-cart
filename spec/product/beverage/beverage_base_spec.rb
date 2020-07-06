require './lib/product/beverage/beverage_base'  #=> add this

describe BeverageBase do
  it { expect(described_class).to be < ProductBase }

  before do
    @base = described_class.new
  end

  it 'tax is 10' do
    expect(@base.tax).to eq(15)
  end

  it 'descriptions is Bibita' do
    expect(@base.description).to eq('Bibita')
  end
end
