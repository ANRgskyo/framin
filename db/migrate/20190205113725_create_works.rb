class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer :user_id, null: false
      t.string :work_name, null: false
      t.string :image_id, null: false
      t.integer :price, null:false, default: "0"
      t.text :background
      t.string :category_id, null:false
      t.boolean :is_active, null: false, default: "true"
      t.timestamps
    end
  end
end
