require 'faker'

# Create Polishes

50.times do 
	Polish.create(
	color: Faker::Commerce.color,
	style: Faker::Lorem.sentence,
	brand: Faker::Lorem.word,
	name: Faker::Name.name
	)
end
polish = Polish.all

# Create Reviews
100.times do
	Review.create(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
	)
end
review = Review.all

puts "Seed finished"
puts "#{Polish.count} polishes created"
puts "#{Review.count} reviews created"