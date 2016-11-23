class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :max_occupants
      t.string :city
      t.string :address
      t.decimal :price
      t.boolean :availability
      t.text :description
      t.integer :number_of_bathrooms
      t.integer :number_of_bedrooms

      t.timestamps
    end
  end
end
