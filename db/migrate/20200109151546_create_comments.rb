class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :commenter, null: false, foreign_key: { to_table: :users}
      t.text :content

      t.timestamps
    end
  end
end
