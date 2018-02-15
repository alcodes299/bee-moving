class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :walk
      t.string :rating, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
