class AddDefToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :listings, :availability, true
  end
end
