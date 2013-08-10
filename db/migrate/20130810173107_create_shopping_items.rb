class CreateShoppingItems < ActiveRecord::Migration
  def change
    create_table :shopping_items do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.belongs_to :shopping_list

      t.timestamps
    end
    add_index :shopping_items, :shopping_list_id
  end
end
