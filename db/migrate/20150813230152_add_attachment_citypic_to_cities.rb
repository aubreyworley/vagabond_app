class AddAttachmentCitypicToCities < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.attachment :citypic
    end
  end

  def self.down
    remove_attachment :cities, :citypic
  end
end
