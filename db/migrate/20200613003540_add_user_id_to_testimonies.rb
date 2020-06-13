class AddUserIdToTestimonies < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonies, :user_id, :integer
  end
end
