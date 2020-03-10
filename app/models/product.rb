class Product < ApplicationRecord
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
