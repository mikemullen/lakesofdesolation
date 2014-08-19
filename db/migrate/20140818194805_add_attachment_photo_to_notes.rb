class AddAttachmentPhotoToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :notes, :photo
  end
end
