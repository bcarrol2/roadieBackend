Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'reviews/index'
      get 'reviews/star_rating'
      get 'reviews/reviews_feed'
      post 'reviews/create'
      get '/show/:id', to: 'reviews#show'
      delete '/destroy/:id', to: 'reviews#destroy'
    end
  end
  # root '/'
  # get '/*path' => 'landing_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
