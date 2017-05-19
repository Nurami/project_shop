ActiveAdmin.register Order do

  permit_params :status, :user_id

  form do |f|
    f.semantic_errors
    f.input :status, collection: Order::STATUSES.invert
    f.input :user, collection: User.all.map {|user| [user.email, user.id]}

    f.actions
  end
end