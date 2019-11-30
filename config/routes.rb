Rails.application.routes.draw do
  resources :topics do
    resources :posts do
       get 'reply', :on => :member
    end
  end
 if Rails.env.production?
   match "*path" , to: redirect('/'), via: 'get'
 end
  root :to => 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
