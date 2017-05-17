class Product < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :description, :amount, :price, presence: true
end
