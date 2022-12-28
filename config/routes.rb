Rails.application.routes.draw do
  patch 'users/update_profile'
  get 'users/account'
  get 'users/profile'
  get 'hotels/index'
  get 'hotels/search'
  get 'hotels/posts'
  devise_for :users
  root 'top#index'
  get 'top/index'
  resources :hotels
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
