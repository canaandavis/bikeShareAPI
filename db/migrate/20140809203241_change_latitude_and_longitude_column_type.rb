class ChangeLatitudeAndLongitudeColumnType < ActiveRecord::Migration
  def change
    change_column :stations, :longitude, :decimal
    change_column :stations, :latitude, :decimal
  end

end
