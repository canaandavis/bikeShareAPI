desc "This task is called by the Heroku scheduler add-on"
task :update_station_data => :environment do
  puts "Updating feed..."
  Station.get_stations_data
  puts "done."
end
