require 'faker'

10.times do
	password = Faker::Internet.password(8)
	User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		user_name: Faker::Internet.user_name,
		password: password,
		password_confirmation: password,
		email: Faker::Internet.email,
		credit_card_number: Faker::Business.credit_card_number,
	)
end

20.times do
	Room.create(
		user_id: rand(9) + 1,
		price:rand(90) + 10,
		availability: true,
		name: Faker::Name.name + " house",
		description:Faker::Lorem.paragraph,
		country:  Faker::Address.country,
		state:  Faker::Address.state,
		city: Faker::Address.city,
		street: Faker::Address.street_name
		)
end