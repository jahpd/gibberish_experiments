class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :code
      t.datetime :created_at

      t.timestamps
    end
  end
end
