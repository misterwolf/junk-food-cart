require './lib/product/food/food_base'

describe FoodBase do
  before do
    @base = described_class.new
  end

  it 'tax is 10.0' do
    expect(@base.tax).to eq(10.0)
  end

  it 'descriptions is Panino' do
    expect(@base.description).to eq('Panino')
  end
end
