class AddAttachmentImageToNoteImages < ActiveRecord::Migration
  def self.up
    change_table :note_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :note_images, :image
  end
end
