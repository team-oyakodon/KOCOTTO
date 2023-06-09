class AddCenterToCity < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :latitude, :float, null: false
    add_column :cities, :longitude, :float, null: false
    add_index :cities, [:latitude, :longitude], unique: true
  end
end
