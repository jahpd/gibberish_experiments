class CreateLibs < ActiveRecord::Migration
  def change
    create_table :libs do |t|
      t.string :name
      t.string :author
      t.text :code
      t.datetime :created_at

      t.timestamps
    end
  end
end
