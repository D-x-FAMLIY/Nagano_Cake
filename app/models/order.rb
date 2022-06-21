class Order < ApplicationRecord
  belongs_to :customer
  
  has_many :product_orders, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { no_payment: 0, confirm_payment: 1, production: 2, ready_to_ship: 3, sent: 4 }

  validates :name, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
  
end
