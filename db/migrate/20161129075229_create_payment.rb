class CreatePayment < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.string :transaction_id
    	t.integer :amount
    	t.integer :last_four_digit
    	t.string :card_type

    	t.belongs_to :reservations, index: true
    end
  end
end
