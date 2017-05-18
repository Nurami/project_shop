class Order < ApplicationRecord
  belongs_to :user

  STATUSES = {
    "in_progress" => "Выполняется",
    "done" => "Выполнен",
    "archived" => "Архивный"
  }

  validates :status, inclusion: STATUSES.keys

  has_many :ordered_products
  has_many :products, through: :ordered_products
end