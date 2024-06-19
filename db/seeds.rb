# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Composition.destroy_all

test_user = User.create(email: "jdoe@gmail.com", password: "password", password_confirmation: "password")


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

print 'Creating compositions'

compositions.each do |comp|
  print '.'
  Composition.create(name: comp, user_id: test_user.id)
end