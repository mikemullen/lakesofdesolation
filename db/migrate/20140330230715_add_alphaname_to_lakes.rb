class AddAlphanameToLakes < ActiveRecord::Migration
  def change
    add_column :lakes, :alphaname, :string
  end
end
