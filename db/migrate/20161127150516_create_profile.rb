class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :language
      t.string :currency 
      t.string :description 
      t.string :address 
      t.integer :phone_number
      t.belongs_to :user_id, index: true

    end
  end
end
