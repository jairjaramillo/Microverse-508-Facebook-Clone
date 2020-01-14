class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.boolean :status
      t.references :sender_id, null: false, foreign_key: { to_table: :users}
      t.references :receiver_id, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
