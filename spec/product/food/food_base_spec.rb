require './lib/product/food/food_base'  #=> add this

describe FoodBase do
  before do
    @base = described_class.new
  end

  it 'tax is 1000' do
    expect(@base.tax).to eq(1000)
  end

  it 'descriptions is Panino' do
    expect(@base.description).to eq('Panino')
  end
end
