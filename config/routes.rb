Rails.application.routes.draw do
  root 'guidelines#index'
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
