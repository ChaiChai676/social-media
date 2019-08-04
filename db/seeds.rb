# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Wiping current data'

User.destroy_all

puts 'Creating users...'

User.create([
  {first_name: "Luis", surname: "Ramirez", email: "lr@lr.com", password: "ardent", password_confirmation: "ardent"},
  {first_name: "Phuong", surname: "To", email: "pt@pt.com", password: "ardent", password_confirmation: "ardent"},
  {first_name: "John", surname: "Smith", email: "js@js.com", password: "ardent", password_confirmation: "ardent"},
  {first_name: "Ben", surname: "Niven", email: "bn@bn.com", password: "ardent", password_confirmation: "ardent"},
  {first_name: "Chai", surname: "Chai", email: "c.chai@hotmail.co.uk", password: "ardent", password_confirmation: "ardent"}
])

puts 'Finished'
