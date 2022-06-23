class ProductOrder < ApplicationRecord
  
  
  belongs_to :order
  belongs_to :product
  
  enum making_status: { no_making: 0, wait_making: 1, now_making: 2, complete_making: 3 }
  
  def subtotal
    product.with_tax_price * quantity
  end
  
end
