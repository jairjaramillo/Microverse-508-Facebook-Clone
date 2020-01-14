class ChangeColumnNameFromFriendshipsTable3 < ActiveRecord::Migration[6.0]
  def change
    rename_column :friendships, :sender_id_id, :sender_id
    rename_column :friendships, :receiver_id_id, :receiver_id
  end
end
