# frozen_string_literal: true

class SeancesController < ApplicationController
  def index
    seances = Seances::Repository.new.find_all
    render json: Seances::Representer.new(seances).basic
  end

  def show
    seance = Seances::Repository.new.find_by(params[:id])
    render json: Seances::Representer.new([seance]).extended
  end

  def update
    seance = Seances::UseCases::Update.new.call(id: params[:id], params: seance_params)
    if seance.valid?
      render json: seance
    else
      render json: seance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Seances::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create

    @seance = Seances::UseCases::Create.new.call(params: seance_params)

    if @seance.valid?
      render json: @seance, status: :created, location: @seance
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  private

  def seance_params
    params.require(:seance).permit(:id, :starts_at, :ends_at, :duration, :movie_id, :hall_id)
  end
end
