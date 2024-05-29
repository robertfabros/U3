require 'active_record'
require 'sqlite3'
require_relative 'ar'
require_relative 'models/category'
require_relative 'models/product'

# Find all the categories in the database
categories = Category.all

# Display all category names and their associated products in a nicely formatted list
categories.each do |category|
  puts "Category: #{category.name}"
  puts "-" * 40
  category.products.each do |product|
    puts "Product Name: #{product.name.ljust(30)} | Price: $#{product.price.round(2)}"
  end
  puts "\n"
end
