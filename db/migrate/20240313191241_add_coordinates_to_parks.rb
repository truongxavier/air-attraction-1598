class AddCoordinatesToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :latitude, :float
    add_column :parks, :longitude, :float
    add_column :parks, :cost, :float
  end
end
