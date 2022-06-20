class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer
  
  #小計を求める記述
  def subtotal
    item.with_tax_price * amount
  end
  
end
