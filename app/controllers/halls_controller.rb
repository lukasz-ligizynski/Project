# frozen_string_literal: true

class HallsController < ApplicationController

  def index
    halls = Hall.all
    render json: HallSerializer.new(halls)
  end

  def show
    @hall = Hall.find(params[:id])
    render json: HallSerializer.new(@hall)
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      render json: HallSerializer.new(@hall), status: :created
    else
      render json: HallSerializer.new(@hall).errors, status: :unprocessable_entity
    end
  end

  def update
    @hall = Hall.find(params[:id])
    if @hall.update(hall_params)
      render json: HallSerializer.new(@hall)
    else
      render json: HallSerializer.new(@hall).errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hall = Hall.find(params[:id])
    @hall.destroy
  end

  private

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end
end
