puts "Clearing out old data..."
Adopter.destroy_all
Pet.destroy_all
Shelter.destroy_all

puts "Generating Adopter Data..."
10.times {
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Adopter.create(first_name: first_name, last_name: last_name)
}

puts "Generating Shelters Data..."
3.times {
    Shelter.create(
        name: Faker::Company.name,
        address: Faker::Address.street_address
    )
}

puts "Generating Pets Data..."
20.times {
    name = Faker::Creature::Dog.name
    age = rand(1..14)
    species = ['dog', 'cat']
    shelter_id = Shelter.all.sample.id
    adopter_id = Adopter.all.sample.id
    Pet.create(name: name, age: age, species: species.sample, adopted?: false, shelter_id: shelter_id, adopter_id: nil)
}
