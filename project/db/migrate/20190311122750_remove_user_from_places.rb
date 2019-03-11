class RemoveUserFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :user_id, :refrences
  end
end
