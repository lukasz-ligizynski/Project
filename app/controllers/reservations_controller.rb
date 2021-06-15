# frozen_string_literal: true

class ReservationsController < ApplicationController
  def index
    reservations = Rservations::Repository.new.find_all
    render json: Rservations::Representer.new(reservations).basic
  end

  def show
    reservation = Rservations::Repository.new.find_by(params[:id])
    render json: Rservations::Representer.new([reservation]).extended
  end

  def update
    reservation = Rservations::UseCases::Update.new.call(id: params[:id], params: reservation_params)
    if reservation.valid?
      render json: reservation
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Rservations::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create
    @reservation = Rservations::UseCases::Create.new.call(params: reservation_params)

    if @reservation.valid?
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :client_id, :seance_id, :ticket_desk_id)
  end
end
