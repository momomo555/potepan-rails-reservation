class RenameUserIdToHotels < ActiveRecord::Migration[6.1]
  def change
    rename_column :hotels, :user_id, :owner_id
  end
end
