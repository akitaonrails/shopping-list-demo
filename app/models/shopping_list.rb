class ShoppingList < ActiveRecord::Base
  attr_accessible :description, :name, :total
end
