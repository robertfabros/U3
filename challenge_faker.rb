require 'active_record'
require 'sqlite3'
require 'faker'
require_relative 'ar'
require_relative 'models/category'
require_relative 'models/product'

# Loop to generate 10 new categories
10.times do
  # Create and save a new category
  category = Category.create(name: Faker::Commerce.department)

  # Loop to generate 10 new products for each category
  10.times do
    product = category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: rand(1.0..100.0).round(2), # Manually generating a random price within the range
      stock_quantity: Faker::Number.between(1, 100)
    )
    product.save
  end
end

puts "10 new categories and 100 new products have been created using Faker."
