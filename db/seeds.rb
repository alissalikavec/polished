require 'faker'

# Create users
5.times do
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save
end
users = User.all

# Create Polishes

50.times do 
	Polish.create(
	user: users.sample,
	color: Faker::Commerce.color,
	style: Faker::Lorem.sentence,
	brand: Faker::Lorem.word,
	name: Faker::Name.name
	)
end
polishes = Polish.all

# Create Reviews
100.times do
	Review.create(
		polish: polishes.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
	)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Polish.count} polishes created"
puts "#{Review.count} reviews created"