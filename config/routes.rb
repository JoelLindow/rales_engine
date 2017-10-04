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
      end

      resources :invoices, only: [:index, :show]



      namespace :transactions do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"

        get '/:id/invoice', to: "invoices#show"

      end


      resources :transactions, only: [:index, :show]




    end
  end
end
