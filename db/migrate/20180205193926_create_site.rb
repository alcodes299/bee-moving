class CreateSite < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.integer :walk_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.integer :location, null: false
      t.boolean :claimed, null: false, default: false
      t.string :flyer, null: false, default: "lol idk it fly's"
    end
  end
end
