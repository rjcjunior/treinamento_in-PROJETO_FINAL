class AddTagToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :tag, :text
  end
end
