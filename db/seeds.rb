# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(first_name: 'John', email: 'john@example.com', password: '123456', password_confirmation: '123456')
    User.create(first_name: 'Jane', email: 'jane@example.com', password: '1234567', password_confirmation: '1234567')
end

if Subscription.count == 0
    Subscription.create(user_id: 1, name: 'Netflix', logo_image: 'netflix.com', amount: 2400, description: 'TV and Movie Streaming Platform')
    Subscription.create(user_id: 2, name: 'Spotify', logo_image: 'spotify.com', amount: 1500, description: 'Music Streaming Platform')
end