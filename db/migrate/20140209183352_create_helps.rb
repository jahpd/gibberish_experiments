class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.text :body
      t.datetime :created_at

      t.timestamps
    end
  end
end
