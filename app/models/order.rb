class Order < ApplicationRecord
  belongs_to :customer
  has_many :product_orders, dependent: :destroy

  validates :name, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
end
