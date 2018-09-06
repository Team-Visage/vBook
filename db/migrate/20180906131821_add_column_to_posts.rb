class AddColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :liked_by, :text, array:true, default: []
  end
end
