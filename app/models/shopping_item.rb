class ShoppingItem < ActiveRecord::Base
  belongs_to :shopping_list
  attr_accessible :name, :price, :quantity

  def sub_total
    quantity * price
  end

  def total
    sub_total + ( sub_total * shopping_list.tax_rate )
  end
end
