class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :cash
      t.integer :credit
      t.integer :debit
      t.integer :assets
      t.integer :current_nisab
      t.integer :zakat_paid

      t.timestamps
    end
  end
end
