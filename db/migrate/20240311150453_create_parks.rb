class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :park_description
      t.text :chambers_description
      t.text :restaurants_description
      t.text :location
      t.float :price

      t.timestamps
    end
  end
end
