module Api
  module V1
    module Customers
      class FavoriteMerchantController < ApplicationController
        def show
          render json: Customer.find(params[:id]).favorite_merchant
        end
      end
    end
  end
end
