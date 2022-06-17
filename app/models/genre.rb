class Genre < ApplicationRecord
  
  #productモデルを参照先に指定
  has_many :products, dependent: :destroy
  
  #nameのバリデーション
  validates :name, presence: true
  
end
