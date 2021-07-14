# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

City.destroy_all
Estate.destroy_all
PickUpStation.destroy_all

cities = CSV.parse(File.read(Rails.root.join("lib","data","towns.csv")),headers: true)
cities.by_col![0].each do |city|
    City.create(city_name: city)
end

db_cities = City.all


estates = CSV.parse(File.read(Rails.root.join("lib","data","estates.csv")),headers: true)
tot_estates = estates.length
x = 0
db_cities.each do |city|
    p city.city_name
    while x < tot_estates do
        
        if city.city_name.downcase.eql?(estates[x]["CITY"].downcase)
            
            Estate.create(city_id: city.id, estate_name: estates[x]["ESTATE"])
        end
        x += 1
    end
    x = 0
end

db_estates = Estate.all
stations = CSV.parse(File.read(Rails.root.join("lib","data","stations.csv")),headers: true)
tot_stations = stations.length

db_estates.each do |estate|
    p estate.estate_name
    while x < tot_stations do
        
        if estate.estate_name.downcase.eql?(stations[x]["Estate"].downcase)
            
            PickUpStation.create(estate_id: estate.id, station_name: stations[x]["Station"], street: stations[x]["Street"])
        end
        x += 1
    end
    x = 0
end








