module Api
  module V1
    module Merchants
      class RandomController < ApplicationController
        def show
          render json: Merchant.pluck.sample(1)
        end

      end
    end
  end
end
