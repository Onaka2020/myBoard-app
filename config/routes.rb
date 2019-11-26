Rails.application.routes.draw do
  resources :topics do
    resources :posts
  end
 
  root :to => 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
