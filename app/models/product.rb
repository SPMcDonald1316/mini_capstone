class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}

  has_many :images
  
  def is_discounted?
    price < 100
  end

  def tax
    tax_rate = 0.09
    price * tax_rate.truncate(2)
  end

  def total
    price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
