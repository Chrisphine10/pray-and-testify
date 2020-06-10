class AddPostToTestimony < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonies, :post_id, :integer
  end
end
