# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Composition.destroy_all
compositions = [
  "Dryad Syndra",
  "Sage Lillia",
  "Dragonlord Xayah",
  "Dragonlord Irelia",
  "Duelist Tristana",
  "Ghostly Zyra",
  "Sage Sylas",
  "Sniper Ashe",
  "Trickshot Kai'Sa"
]


compositions.each do |comp|
  Composition.create(name: comp)
end