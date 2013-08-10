class ShoppingCalculator
  def initialize(shopping_list)
    @shopping_list = shopping_list
  end

  def shopping_items
    @shopping_list.shopping_items
  end

  def total
    shopping_items.map(&:total).reduce(&:+)
  end
end
