class AddColumnReservation < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reservations, :payment, index: true
  end
end
