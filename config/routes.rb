Timish::Application.routes.draw do

  devise_for :users

  resources :punches do
  	collection do
  		get :autocomplete
  	end
  end

  namespace :reporting do
  	resources :punches
  	match 'timeline' => 'punches#timeline'
  	root :to => 'punches#index'
  end

  root :to => "punches#index"
end
