# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env =='development'
  User.create(name: 'user1',age: 13, role: 'A',carma: 15)
  User.create(name: 'user2', age: 18,role: 'U', carma: 89 )
  User.create(name: 'user33', age: 34, role: 'M', carma: 1)

end
