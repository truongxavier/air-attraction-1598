class CreateParkReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :park_reviews do |t|
      t.references :rental, null: false, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
