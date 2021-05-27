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
    success = ->(hall) { render json: HallSerializer.new(hall), status: :created }
    error = ->(hall) { render json: HallSerializer.new(hall).errors, status: :unprocessable_entity }

    UseCase::Hall::Create.new(repo).call(hall_params, success: success, failure: error)
  end

  def update
    @hall = repo.find(params[:id])

    success = ->(hall) { render json: HallSerializer.new(hall), status: :created }
    error = ->(hall) { render json: HallSerializer.new(hall).errors, status: :unprocessable_entity }

    UseCase::Hall::UpdateHall.call(@hall, hall_params, success: success, failure: error)
  end

  def destroy
    @hall = repo.find(params[:id])
    success = -> { render json: { status: 'success' } }
    error = -> { render json: { status: 'unprocessable_entity' } }

    UseCase::Hall::DeleteHall.call(hall_params, success: success, failure: error)
  end

  private

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end

  def repo
    @repo ||= HallRepository.new
  end
end
