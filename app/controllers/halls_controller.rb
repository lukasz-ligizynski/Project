# frozen_string_literal: true
class HallsController < ApplicationController
  def index
    hall = repo.all
    render json: HallSerializer.new(hall)
  end

  def show
    @hall = repo.find(params[:id])
    render json: HallSerializer.new(@hall)
  end

  def create
    @hall = repo.new_entiti(hall_params)
    if repo.save(@hall)
      render json: HallSerializer.new(@hall), status: :created
    else
      render json: HallSerializer.new(@hall).errors, status: :unprocessable_entity
    end
  end

  def update
    @hall = repo.find(params[:id])
    if repo.update(hall_params)
      render json: HallSerializer.new(@hall)
    else
      render json: HallSerializer.new(@hall).errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hall = repo.find(params[:id])
    repo.destroy
    render json: {status: "success"}
  end

  private

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end

  def repo
    @repo ||= HallRepository.new
  end
end
