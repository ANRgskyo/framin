class CreateCartWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_works do |t|
      t.integer :work_id, null: false
      t.integer :shopping_cart_id, null: false
      t.integer :price
      t.integer :quantity, null: false, default: 1
      t.integer :size_id, null: false
      t.timestamps
    end
  end
end
