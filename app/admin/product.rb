ActiveAdmin.register Product do
  permit_params :title, :description, :amount

  form title: "Редактирование товара" do |f|
    panel "Свойства" do
      f.semantic_errors
      f.input :title, label: "Названия товара"
      f.input :description, label: "Описание товара"
      f.input :amount, label: "Количество товара"

      f.actions
    end
  end
end