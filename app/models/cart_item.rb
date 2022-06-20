class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer
  
  #小計を求める記述
  def subtotal
    product.with_tax_price * amount
  end
  
end
