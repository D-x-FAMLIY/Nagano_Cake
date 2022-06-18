class Address < ApplicationRecord
  belongs_to :user


  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
