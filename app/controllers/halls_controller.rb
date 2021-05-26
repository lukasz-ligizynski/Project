class HallsController < ApplicationController

    before_action :set_hall, only: [:show, :update, :destroy]

    def index
        @halls = Hall.all.map do |hall|
            {
                name: hall.hall_number,
                capacity: hall.capacity
            }
        end
        
        render json: @halls
    end

    def show
        @hall = {
        id: @hall.id,hall_name: @hall.hall_number, capacity: @hall.capacity,
        }
        render json: @hall
    end

    def create
        @hall = Hall.new(hall_params)
        if @hall.save
            render json: @hall, status: :created
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def update
        if @hall.update(hall_params)
            render json: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @hall.destroy
    end
    
    private
    def set_hall
        @hall = Hall.find(params[:id])
    end
        
    def hall_params
        params.require(:hall).permit(:hall_number, :capacity)
    end
end
