class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping_list
  attr_accessible :name, :price, :quantity

  def total
    quantity * price
  end
end
