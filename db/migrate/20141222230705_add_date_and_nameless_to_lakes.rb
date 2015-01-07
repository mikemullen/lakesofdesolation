class AddDateAndNamelessToLakes < ActiveRecord::Migration
  def change
    add_column :lakes, :hikedate, :date
    add_column :lakes, :infolink, :string
    add_column :lakes, :elevation, :integer
    add_column :lakes, :nameless, :boolean
  end
end
