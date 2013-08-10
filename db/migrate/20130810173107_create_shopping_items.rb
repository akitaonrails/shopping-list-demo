class CreateShoppingItems < ActiveRecord::Migration
  def change
    create_table :shopping_items do |t|
      t.string :name
      t.integer :quantity, default: 0
      t.float :price, default: 0.0
      t.belongs_to :shopping_list

      t.timestamps
    end
    add_index :shopping_items, :shopping_list_id
  end
end
