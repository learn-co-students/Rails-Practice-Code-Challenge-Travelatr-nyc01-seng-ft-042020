class DestinationsController < ApplicationController

    def show
        @destination = Destination.find(params[:id])
    end

    private

    def destination_params
        params.require[:destination].permit(:name, :bio, :age)
    end
    
end
