# frozen_string_literal: true

class HallsController < ApplicationController
  def index
    @halls = Halls::UseCases::FindAll.new.call
    render json: Halls::Representer.new(@halls).basic
  end

  def show
    hall = Halls::Repository.new.find_by(params[:id])
    render json: Halls::Representer.new([hall]).extended
  end

  def update
    hall = Halls::UseCases::Update.new.call(id: params[:id], params: hall_params)
    if hall.valid?
      render json: hall
    else
      render json: hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Halls::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  private

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end
end
