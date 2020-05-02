class AddMosqueIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :mosque, null: false, foreign_key: true
  end
end
