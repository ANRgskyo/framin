class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.integer :user_id, null: false
      t.integer :bank_name, null: false
      t.integer :branch_number, null: false
      t.integer :account_number, null: false
      t.string :surname, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
