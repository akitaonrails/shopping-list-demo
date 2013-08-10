class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping_list
  attr_accessible :name, :price, :quantity

  def sub_total
    quantity * price
  end
end
