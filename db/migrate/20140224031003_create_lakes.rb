class CreateLakes < ActiveRecord::Migration
  def change
    create_table :lakes do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
