Rails.application.routes.draw do

  devise_for :students
  devise_for :users
  root 'welcome#index'
  resources :cabs do
    member do
      get :toggle_status
    end
  end

  get 'users', to: 'users#index'
  # get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
