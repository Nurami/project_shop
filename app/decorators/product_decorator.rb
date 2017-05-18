class ProductDecorator < Draper::Decorator
  delegate_all

  decorates_association :comments

  def truncated_description
    h.truncate(object.description, length: 64)
  end

  def current_amount
    "На складе: #{product.amount} шт."
  end

  def price_in_rur
    "#{product.price} ₽"
  end

  def comments_exists?
    object.comments.exists?
  end
end