class CreateNoteImages < ActiveRecord::Migration
  def change
    create_table :note_images do |t|
      t.string :caption
      t.integer :note_id

      t.timestamps
    end
  end
end
