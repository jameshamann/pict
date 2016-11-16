Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "photos#index"

  resources :photos do
    resources :comments
    member do
    put "like", to: "photos#upvote"
    put "dislike", to: "photos#downvote"
    end
  end
end
