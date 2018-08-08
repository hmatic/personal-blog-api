class CreatePostsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags, id: false do |t|
      t.belongs_to :posts, index: true
      t.belongs_to :tags, index: true
    end
  end
end
