class Order < ApplicationRecord
  belongs_to :customer

  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { no_payment: 0, confirm_payment: 1, production: 2, ready_to_ship: 3, sent: 4 }

  validates :name, presence:true
  validates :post_code, presence:true
  validates :address, presence:true



  def total_items
     sum = 0
      product_orders.each do |product_order|
      sum += product_order.price * product_order.quantity
    end
     sum
  end
  
  
  
  

  #def total_items
    #sum = 0
      #product_orders.each do |product_order|
      #sum += product_order.price * product_order.quantity
    #end
    #sum
  #end

    # def subtotal
    #   product_order.with_tax_price * quantity
    # end

end
