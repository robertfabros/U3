require_relative 'ar.rb'
require_relative 'models/product.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Additional code to meet the challenge requirements

# Find any product
product = Product.first

# Inspect the Product object
puts "Inspecting a product: #{product.inspect}"

# Print out the column names
puts "Columns in products table: #{Product.column_names.join(', ')}"

# ActiveRecord queries

# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# Names of all products above $10 with names that begin with the letter C
products_above_10_with_c = Product.where('price > ? AND name LIKE ?', 10, 'C%').pluck(:name)
puts "Products above $10 with names that begin with 'C': #{products_above_10_with_c.join(', ')}"

# Total number of products with low stock quantity (less than 5 in stock)
low_stock_products = Product.where('stock_quantity < ?', 5).count
puts "Total number of products with low stock quantity: #{low_stock_products}"

# 1. Find the name of the category associated with one of the products
product_with_category = Product.first
if product_with_category && product_with_category.category
  puts "The category associated with the product '#{product_with_category.name}' is '#{product_with_category.category.name}'."
else
  puts "No category associated with the product."
end

# 2. Find a specific category and use it to build and persist a new product
specific_category = Category.find_by(name: 'Electronics')
if specific_category
  new_product = specific_category.products.build(name: 'New Gadget', price: 99.99, stock_quantity: 50)
  new_product.save
  puts "New product '#{new_product.name}' created in category '#{specific_category.name}'."
else
  puts "Category 'Electronics' not found."
end

# 3. Find a specific category and then use it to locate all the associated products over a certain price
category_for_query = Category.find_by(name: 'Seafood')
if category_for_query
  expensive_products = category_for_query.products.where('price > ?', 50)
  puts "Products in category 'Seafood' with price over $50:"
  expensive_products.each do |product|
    puts "ID: #{product.id}, Name: #{product.name}, Price: $#{product.price}, Stock Quantity: #{product.stock_quantity}"
  end
else
  puts "Category 'Seafood' not found."
end
