class HallsController < ActionController::API

    def index 
        @halls = Hall.all
        render json: @halls
    end

    def show
        @hall = Hall.find(params[:id])
        render json: @hall
    end
    
    def create
        @hall = Hall.create(hall_params)
    
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
end
