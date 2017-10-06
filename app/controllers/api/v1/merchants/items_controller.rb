module Api
  module V1
    module Merchants
      class ItemsController < ApplicationController

        def index
          render json: Merchant.find(params[:id]).items
        end

      end
    end
  end
end
