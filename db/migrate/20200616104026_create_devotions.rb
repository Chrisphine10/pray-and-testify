class CreateDevotions < ActiveRecord::Migration[6.0]
  def change
    create_table :devotions do |t|
      t.string :verse
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
