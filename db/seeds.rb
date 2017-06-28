# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    email: 'rsequeira@wearegap.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  },
  {
    email: 'framirez@wearegap.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  },
  {
    email: 'maraya@wearegap.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  },
  {
    email: 'ejuarez@wearegap.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  }
]
existing_users = User.where(email: users.map {|u| u[:email]}).pluck(:email)
users.reject! {|un| existing_users.include?(un[:email])}

puts "-- Creating users: #{users.map{|u| u[:email]}.join(', ')}"
User.create!(users)

apps = [
  {
    app: {name: 'Customers'},
    roles: [
      {name: 'Admin'},
      {name: 'Delivery'},
      {name: 'Sales'}
    ]
  },
  {
    app: {name: 'Payments'},
    roles: [
      {name: 'Accounts'},
      {name: 'Providers'},
      {name: 'Banks'}
    ]
  }
]

apps.each do |a|
  puts "-- Creating App: #{a[:app][:name]}"
  app = App.create!(a[:app])

  puts "  -- Creating Roles: #{a[:roles].map{|r| r[:name]}.join(', ')}"
  app.roles.create!(a[:roles])
end
