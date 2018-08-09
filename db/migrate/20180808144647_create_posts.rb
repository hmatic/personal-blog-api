class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :status, null: false, default: 0
      t.datetime :published_on
      
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
