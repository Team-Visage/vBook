class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.timestamps
      t.integer :user_id
      t.integer :post_likes
      t.integer :post_flags
      t.string  :post_tags
    end
  end
end
