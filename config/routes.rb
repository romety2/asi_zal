Rails.application.routes.draw do

  devise_for :users
  	resources :corpses
	root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
