# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
   User.create!(
   email:    Faker::Internet.unique.email,
   password: Faker::Internet.unique.password(8),
   role: 'standard'
   )
 end

users = User.all

 5.times do
    Wiki.create!(
    title:    Faker::Company.unique.name,
    body: Faker::Company.unique.catch_phrase,
    private: false,
    user: users.sample
    )
  end


admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

premium = User.create!(
  email:    'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
