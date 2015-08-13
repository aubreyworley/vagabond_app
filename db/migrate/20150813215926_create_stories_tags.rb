class CreateStoriesTags < ActiveRecord::Migration
  def change
    create_table :stories_tags do |t|
      t.belongs_to :story, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
