Rails.application.routes.draw do
  resources :lists, only: [ :index, :new, :create, :show ]
  resources :bookmarks, only: [:new, :create, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
