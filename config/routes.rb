Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        # resources :items, only: [:show]
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end

      resources :merchants, only: [:index, :show]

      namespace :invoices do
        get '/find', to: "find#show"
        get '/:id/transactions', to: "transactions#index"
      end

      resources :invoices, only: [:index, :show]




    end
  end
end
