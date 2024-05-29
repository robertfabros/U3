require 'active_record'
require 'sqlite3'
require_relative 'ar.rb'
require_relative 'models/product.rb'

# Create three new products using three different ways to create new AR objects
# Method 1: Using new and save
product1 = Product.new(name: 'Product 1', price: 10.0, stock_quantity: 100)
product1.save

# Method 2: Using create
product2 = Product.create(name: 'Product 2', price: 20.0, stock_quantity: 200)

# Method 3: Using new and save with a bang
product3 = Product.new(name: 'Product 3', price: 30.0, stock_quantity: 300)
product3.save!

puts "Products created successfully."

# Create a Product object that is missing some required columns
invalid_product = Product.new(name: nil, price: nil, stock_quantity: nil)

# Attempt to save this product and print all the AR errors which are generated
unless invalid_product.save
  puts "Validation errors: "
  invalid_product.errors.full_messages.each do |message|
    puts message
  end
end
