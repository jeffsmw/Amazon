20.times do
  Category.create({ name:      Faker::Pokemon.location })
end
