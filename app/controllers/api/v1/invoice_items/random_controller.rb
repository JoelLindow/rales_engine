module Api
  module V1
    module InvoiceItems
      class RandomController < ApplicationController

        def show
          render json: InvoiceItem.pluck.sample(1)
        end

      end
    end
  end
end
