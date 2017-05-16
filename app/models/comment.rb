class Comment < ApplicationRecord
  belongs_to :product

  validates :text, precence: true
end
