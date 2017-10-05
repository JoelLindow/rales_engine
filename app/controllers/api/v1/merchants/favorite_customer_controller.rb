module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApplicationController

        def show
          render json: Merchant.find(params[:id]).favorite_customer
        end

      end
    end
  end
end
