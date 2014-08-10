require 'net/http'
require 'json'

class Station < ActiveRecord::Base

  def self.get_stations_data(request_url = 'http://api.citybik.es/v2/networks/austin?fields=stations')
    url = URI.parse(request_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    if res.kind_of? Net::HTTPSuccess
      stations = JSON.parse res.body
      self.add_stations stations["network"]["stations"]
      { :success => true, :response => stations }
    else
      { error: true }
    end
  end

  def self.add_stations(stations)
    stations.each do |station|
      puts station["latitude"]
      current_station = Station.find_by(network_id: station["id"])
      if current_station
        current_station.update(
          name: station["name"],
          empty_slots: station["empty_slots"],
          free_bikes: station["free_bikes"],
          longitude: station["longitude"],
          latitude: station["latitude"]
        )
      else
        Station.create(
          name: station["name"],
          empty_slots: station["empty_slots"],
          free_bikes: station["free_bikes"],
          longitude: station["longitude"],
          latitude: station["latitude"],
          network_id: station["id"]
        )
      end
    end
  end
end
