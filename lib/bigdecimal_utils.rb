require 'bigdecimal'

# StringUtils
# add facilities to String class.
# Include it with 'using' key
module BigDecimalUtils
  refine BigDecimal do
    # Show the usual two decimal place in the currency value
    def two_decimal
      format('%.2f', self)
    end
  end
end
