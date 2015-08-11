class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :author
      t.string :title
      t.string :body
      t.belongs_to :user
      t.belongs_to :city
      t.timestamps null: false
    end
  end
end
