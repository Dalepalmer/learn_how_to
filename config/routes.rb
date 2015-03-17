Rails.application.routes.draw do
  root :to => 'chapters#index'

  resources :chapters do
    resources :lessons
  end
end
