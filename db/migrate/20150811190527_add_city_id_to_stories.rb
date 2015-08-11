class AddCityIdToStories < ActiveRecord::Migration
  change_table :stories do |t|
      t.belongs_to :city
    end

end
