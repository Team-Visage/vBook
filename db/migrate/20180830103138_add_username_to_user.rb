class AddUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :image_url,  :string
    add_column :users, :bio_desc,   :string
    add_index :users, :username, unique: true
  end
end
