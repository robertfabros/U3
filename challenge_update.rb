# challenge_update.rb
require 'active_record'
require 'sqlite3'
require_relative 'ar'
require_relative 'models/product'

# Find all products with a stock quantity greater than 40
products = Product.where('stock_quantity > ?', 40)

# Increment the stock quantity of each product by one
products.each do |product|
  product.stock_quantity += 1
  product.save
end

puts "Updated stock quantities for products with stock quantity greater than 40."
