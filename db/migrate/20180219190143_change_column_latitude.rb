class ChangeColumnLatitude < ActiveRecord::Migration[5.1]
  def change
    change_column :sites, :latitude, :integer, :default => 0, :null => false
  end
end
