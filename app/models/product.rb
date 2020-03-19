class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}


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
end
