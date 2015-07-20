Rails.application.routes.draw do
  root 'athletes#index'

  resources :athletes, except: [:new, :edit]
end
