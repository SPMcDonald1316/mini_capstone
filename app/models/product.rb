class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 40}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}
  def is_discounted?
    price < 10
  end

  def tax
    tax_rate = 0.09
    price * tax_rate.truncate(2)
  end

  def total
    price + tax
  end
end
