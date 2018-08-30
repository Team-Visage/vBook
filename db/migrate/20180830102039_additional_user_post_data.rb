class AdditionalUserPostData < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id,    :integer
    add_column :posts, :post_likes, :integer, default: 0
    add_column :posts, :post_flags, :integer
    add_column :posts, :post_tags,  :string
  end
end
