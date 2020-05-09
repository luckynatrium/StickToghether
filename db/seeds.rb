# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.form([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.form(name: 'Luke', movie: movies.first)
admin = AdminUser.create!(email: 'admin@m.com', password: 'charlemagne', password_confirmation: 'charlemagne')
Interest.create(name: 'cinema')
Interest.create(name: 'sport')
Interest.create(name: 'date')
Interest.create(name: 'board games')
Interest.create(name: 'lunch')
Interest.create(name: 'work')
Interest.create(name: 'trip')
Interest.create(name: 'party')

u1 = User.create!(name: 'boris', age: 18, role: 'U',email: 'boris@mail.com',password:'123456',
                  carma: 0 )
Interest.add_interests(u1,[1,2,3,4,6])
u2 = User.create!(name: 'lonelygirl', age: 21, role: 'U',email: 'lonelygirl@mail.com',password:'123456',
                  carma: 0)
Interest.add_interests(u2,[1,2,3,4,5])
u3 = User.create!(name: 'babuin', age: 32, role: 'U',email: 'babuin@mail.com',password:'123456',
                  carma: 0 )
Interest.add_interests(u3,[7, 6])
u4 = User.create!(name: 'major321', age: 18, role: 'U',email: 'major321@mail.com',password:'123456',
                  carma: 0 )
Interest.add_interests(u4,[1,2,3,5,7])



e1 = Event.create!(name:'Help me with site',description: 'I really need help in frontend. Just look at this',
                   date: Time.now + 1.day, duration: 3.month, approved: true, approved_by: admin.id,
                   creator_id: u1.id)
Interest.add_interests(e1,[6])
e2 = Event.create!(name:'Just go out',description: 'The weather outside is really nice. Wanna join me? Warning: JUST go out',
                   date: Time.now + 2.day, duration: 4.hour, approved: true, approved_by: admin.id,
                   creator_id: u2.id)
Interest.add_interests( e2,[3])
e3 = Event.create!(name:'Raid',description: 'The weather outside is really nice. Wanna join me? Warning: JUST RAID',
                   date: Time.now + 1.day, duration: 4.day, approved: true, approved_by: admin.id,
                   creator_id: u3.id)
Interest.add_interests(e3,[3, 6, 7])
e4 = Event.create!(name:'New party, HYPE!!!',description: 'Parents will leave at weekend, so lets party all night',
                   date: Time.now + 6.day, duration: 2.day, approved: true, approved_by: admin.id,
                   creator_id: u4.id)
Interest.add_interests(e4,[8])