# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = [
  { first_name: "Zabuza", last_name: "Momoshi", birth_year: 2004, is_alive: false },
  { first_name: "Shinji", last_name: "Hikari", birth_year: 2001, is_alive: true },
  { first_name: "Tetsuo", last_name: "Shima", birth_year: 2004, is_alive: false },
  { first_name: "Alf", last_name: "Tanner", birth_year: 1756, is_alive: true },
]

Author.create(authors)

User.create(email: 'tester@tester.com' , password: '123456', is_superadmin: true)
User.create(email: 'user@user.com' , password: '654321', is_superadmin: false)