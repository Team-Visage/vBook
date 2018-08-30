class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username
    add_column :users, :bio_desc, :string
    add_column :users, :img_url, :string
  end
end
