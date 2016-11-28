class AddColumnToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :heading, :string
  end
end
