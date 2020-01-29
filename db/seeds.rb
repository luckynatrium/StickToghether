# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.form([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.form(name: 'Luke', movie: movies.first)

Interest.create(name: 'cinema')
Interest.create(name: 'sport')
Interest.create(name: 'date')
Interest.create(name: 'board games')
Interest.create(name: 'lunch')


#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?