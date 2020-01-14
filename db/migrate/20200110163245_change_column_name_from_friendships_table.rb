class ChangeColumnNameFromFriendshipsTable < ActiveRecord::Migration[6.0]
  def change
    def change
      rename_column :friendships, :sender_id_id, :sender
      rename_column :friendships, :receiver_id_id, :receiver
    end
  end
end
