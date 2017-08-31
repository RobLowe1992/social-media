class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.integer :likes

      t.timestamps
    end
  end
end
