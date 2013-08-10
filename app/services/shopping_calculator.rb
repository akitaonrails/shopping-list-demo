class ShoppingCalculator
  def initialize(shopping_list)
    @shopping_list = shopping_list
  end

  def shopping_items
    @shopping_list.shopping_items
  end

  def tax_rate
    @shopping_list.tax_rate
  end

  def total
    shopping_items.inject(0.0) do |total, item|
      total += item.sub_total + (tax_rate * item.sub_total)
    end
  end
end
