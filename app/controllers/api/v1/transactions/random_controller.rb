module Api
  module V1
    module Transactions
      class RandomController < ApplicationController

        def show
          render json: Transaction.pluck.sample(1)
        end

      end
    end
  end
end
