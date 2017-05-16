class Product < ApplicationRecord
  has_many :comments, dependent: :destroy

  validate :title, :description, :amount, :price, presence: true
end
