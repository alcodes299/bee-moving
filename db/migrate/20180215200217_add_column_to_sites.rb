class AddColumnToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :longitude, :string, null: false, default: "0"
  end
end
