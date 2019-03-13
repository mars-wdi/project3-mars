# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Place.create([{country:'Saudi Arabia',city:'Riyadh',catogry:'Food',name:'Rawan'},
# {country:'Saudi Arabia',city:'Riyadh',catogry:'Food',name:'Saja'},
# {country:'Saudi Arabia',city:'Riyadh',catogry:'Food',name:'Abdulrahman'},
# {country:'Saudi Arabia',city:'Riyadh',catogry:'Food',name:'Anfal'},
# {country:'Saudi Arabia',city:'Riyadh',catogry:'Food',name:'Mohammed'}])
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'placescsv.csv'))

csv = CSV.parse(csv_text, :headers => true ,:encoding => 'utf-8')
csv.each do |row|
  t = Place.new
  t.name = row['Name']
  t.country = row['Country']
  t.city = row['City']
  t.catogry = row['Catogry']
  t.image = row['Image']
  t.latitude = row['Latitude']
  t.longitude = row['longitude']
  t.save!
end