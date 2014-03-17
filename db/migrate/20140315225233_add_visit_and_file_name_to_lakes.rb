class AddVisitAndFileNameToLakes < ActiveRecord::Migration
  def change
    add_column :lakes, :filename, :string
    add_column :lakes, :visited, :boolean
  end
end
