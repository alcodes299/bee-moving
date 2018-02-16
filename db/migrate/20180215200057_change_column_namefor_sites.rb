class ChangeColumnNameforSites < ActiveRecord::Migration[5.1]
  def change
    rename_column :sites, :location, :latitude, null: false, default: "0"
  end
end
