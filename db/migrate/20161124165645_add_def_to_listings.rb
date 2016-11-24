class AddDefToListings < ActiveRecord::Migration[5.0]
  def change 
 		change_column_default :users, :roles, "tenant"
 	end
end
