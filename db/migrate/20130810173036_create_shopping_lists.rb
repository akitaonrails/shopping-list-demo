class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.text :description
      t.float :total

      t.timestamps
    end
  end
end
