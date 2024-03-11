class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :park, null: false, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.integer :visitors_number
      t.boolean :validated

      t.timestamps
    end
  end
end
