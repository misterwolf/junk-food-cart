# StringUtils
# add facilities to String class.
# Include it with 'using' key
module StringUtils
  refine String do
    # Add euro sim to string
    def add_euro_sym
      "#{self}€"
    end
  end
end
