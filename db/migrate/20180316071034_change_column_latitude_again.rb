class ChangeColumnLatitudeAgain < ActiveRecord::Migration[5.1]
  def change
    change_column :sites, :latitude, :float, :default => 0.00, :null => false
  end
end
