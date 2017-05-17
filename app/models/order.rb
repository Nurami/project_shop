class Order < ApplicationRecord
  belongs_to :user

  STATUSES = {
    "in progress" => "Выполняется",
    "done" => "Выполнен",
    "archived" => "Архивный"
  }

  validates :status, inclusion: STATUSES.keys

  has_many :ordered_product
  has_many :product, through: :ordered_product
end
