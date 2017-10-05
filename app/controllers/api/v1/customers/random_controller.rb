module Api
  module V1
    module Customers
      class RandomController < ApplicationController

        def show
          render json: Customer.pluck.sample(1)
        end

      end
    end
  end
end
