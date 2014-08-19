class AddFieldsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :text, :text
    add_column :notes, :sort_date, :date
    add_column :notes, :author, :string
    add_column :notes, :imgcap, :string
  end
end
