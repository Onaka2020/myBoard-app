class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :contributor
      t.text :content
      t.integer :post_number
      t.integer :reply
      
      t.timestamps
    end
  end
end
