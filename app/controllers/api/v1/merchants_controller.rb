module Api
  module V1
    class MerchantsController < ApplicationController
      def index
        render json: Merchant.all
      end
    end
  end
end
