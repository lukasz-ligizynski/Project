class HallsController < ActionController::API
def index 
    @halls = Hall.all
    render json: @halls
end
end
