class AddIndexToLakes < ActiveRecord::Migration
  def change
    add_index :lakes, :slug
  end
end
