require './lib/product/product_base'

describe ProductBase do
  it { is_expected.to respond_to(:full_price) }
  it { is_expected.to respond_to(:tax_evaluation) }
end
