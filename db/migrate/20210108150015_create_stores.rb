class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :opening_hours
      t.decimal :cash_balance
      t.text :books

      t.timestamps
    end
  end
end
