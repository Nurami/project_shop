class OrderDecorator < Draper::Decorator
  delegate_all

  def status
    Order::STATUSES[object.status]
  end
end