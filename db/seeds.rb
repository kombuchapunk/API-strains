# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
Strain.destroy_all
Effect.destroy_all
Flavor.destroy_all
Rating.destroy_all
csv_text = File.read(Rails.root.join('lib', 'seeds', 'cannabis.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
i = 0
csv.each do |row|
  strain =  row.to_hash
  new_strain = Strain.new(:name => strain["Strain"], :description => strain["Description"], :type_name => strain["Type"], :strain_effects => strain["Effects"], :strain_flavors => strain["Flavor"])
  if new_strain.save
    new_strain.ratings.create(:rating => strain["Rating"])
  end
end
