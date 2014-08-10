class AddTimestampToStations < ActiveRecord::Migration
  def change
    add_column :stations, :timestamp, :string
  end
end
