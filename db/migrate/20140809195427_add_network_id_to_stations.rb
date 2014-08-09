class AddNetworkIdToStations < ActiveRecord::Migration
  def change
    add_column :stations, :network_id, :string
  end
end
