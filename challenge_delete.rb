# challenge_delete.rb
require 'active_record'
require 'sqlite3'
require_relative 'ar'
require_relative 'models/product'

# Find one of the products created in challenge_create.rb
# Assuming 'Product 1' was one of the products created
product_to_delete = Product.find_by(name: 'Product 1')

# Check if the product exists and delete it
if product_to_delete
  product_to_delete.destroy
  puts "Product '#{product_to_delete.name}' with ID #{product_to_delete.id} was deleted."
else
  puts "Product not found."
end
