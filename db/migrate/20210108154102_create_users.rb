class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cash_balance
      t.text :purchase_history

      t.timestamps
    end
  end
end
