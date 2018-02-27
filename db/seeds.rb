10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

user1 = User.create(email: "test@test.com", password: "password")
user2 = User.create(email: "test2@test.com", password: "password")
user3 = User.create(email: "test3@test.com", password: "password")
