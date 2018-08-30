class AdditionalUserPostData < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_url,  :string
    add_column :users, :bio_desc,   :string
    add_column :posts, :user_id,    :integer
    add_column :posts, :post_likes, :integer
    add_column :posts, :post_flags, :integer
    add_column :posts, :post_tags,  :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
