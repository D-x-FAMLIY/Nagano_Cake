class Product < ApplicationRecord
  has_one_attached :image
  # ジャンルを紐付け
  belongs_to :genre

  has_many :cart_items, dependent: :destroy
  has_many :product_orders, dependent: :destroy

  # バリデーション
  validates :image,presence:true
  validates :name,presence:true
  validates :introduction,presence:true
  validates :genre,presence:true
  validates :price_without_tax,presence:true
  validates :is_active, inclusion: { in: [true, false] }


  # 画像投稿の記述
    def get_image
      (image.attached?) ? image : 'no_image.jpg'
    end

    #消費税を求める記述
    def with_tax_price
      (price_without_tax * 1.1).floor
    end





end
