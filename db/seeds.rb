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

# Create reviews

 100.times do
 	Review.create(
 		user: users.sample,
 		polish: polishes.sample,
 		title: Faker::Lorem.sentence,
 		body: Faker::Lorem.paragraph
 		)
 end

# Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save


 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Polish.count} polishes created"
puts "#{Review.count} reviews created"