class RemoveColumnPayments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :payments, :reservations_id
  end
end
