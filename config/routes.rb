Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :users do
    resources :events do
      resources :albums
    end
  end

  if Rails.env.production?
    mount Shrine.presign_endpoint(:cache) => "/s3/params"
  else
    # In development and test environment we're using filesystem storage
    # for speed, so on the client side we'll upload files to our app.
    mount Shrine.upload_endpoint(:cache) => "/upload"
  end
end
