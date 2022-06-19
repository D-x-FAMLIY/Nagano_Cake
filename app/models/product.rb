class Product < ApplicationRecord
  has_one_attached :image
  # ジャンルを紐付け
  belongs_to :genre

  has_many :cart_items, dependent: :destroy
  has_many :product_orders, dependent: :destroy




  # 画像投稿の記述
　 def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end





end
