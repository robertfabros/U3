class Product < ActiveRecord::Base
  # Columns in products table: id, name, price, stock_quantity, category_id

  # Based on the columns, the products table has a foreign key 'category_id' indicating an association with the 'categories' table.

  # Associations
  belongs_to :category

  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :price, presence: true
  validates :stock_quantity, presence: true
  # Assuming price and stock_quantity are necessary columns and should always have values.

  # You can add more validations for other columns if necessary
end
