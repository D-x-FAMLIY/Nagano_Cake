class Genre < ApplicationRecord
  
  #productモデルを参照先に指定
  belongs_to :product
  
  #nameのバリデーション
  validates :name, presence: true
  
end
