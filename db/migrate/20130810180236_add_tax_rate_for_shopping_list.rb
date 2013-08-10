class AddTaxRateForShoppingList < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :tax_rate, :float, :default => 0.0
  end
end
