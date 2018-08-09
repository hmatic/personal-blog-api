Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :posts, except: [:new, :edit]
      resources :categories, except: [:new, :edit]
      resources :tags, except: [:new, :edit]

      resource :session, only: [:create, :destroy]
    end
  end
end
