class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :empty_slots
      t.integer :free_bikes
      t.integer :latitude
      t.integer :longitude
      t.string :name
    end
  end
end
