class AddProductIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :product_id, :integer
  end
end
