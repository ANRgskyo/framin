class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :user_id, null: false
      t.integer :buy_user_id, null: false
      t.integer :status, null: false
      t.integer :work_id, null: false
      t.integer :size_id, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
