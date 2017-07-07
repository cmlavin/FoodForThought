class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :reader_id
      t.text :content
      t.datetime :publish_date

      t.timestamps
    end
  end
end
