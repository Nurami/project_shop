class ProductPolicy
  attr_reader :user

  def initialize(product, user)
    @product = product
    @user = user
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user && user.role == "administrator"
  end
end
