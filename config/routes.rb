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

      namespace :invoices do
        get '/find', to: "find#show"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/customer', to: "customers#show"
        get '/:id/merchant', to: "merchants#show"
      end

      resources :merchants, only: [:index, :show]
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
