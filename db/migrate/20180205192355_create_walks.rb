class CreateWalks < ActiveRecord::Migration[5.1]
  def change
    create_table :walks do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.integer :location, null: false
    end
  end
end
