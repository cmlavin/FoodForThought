class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :title
      t.text :content
      t.integer :author_id
      t.datetime :publish_date
      t.timestamps
    end
  end
end
