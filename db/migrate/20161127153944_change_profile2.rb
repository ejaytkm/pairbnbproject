class ChangeProfile2 < ActiveRecord::Migration[5.0]

  def change
  	remove_column :profiles, :user_id_id
  end
end
