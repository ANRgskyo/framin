class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false, default: "0"
      t.timestamps
    end
  end
end
