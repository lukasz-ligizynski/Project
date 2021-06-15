# frozen_string_literal: true

class ReservationsController < ApplicationController
  def index
    reservations = Reservations::Repository.new.find_all
    render json: Reservations::Representer.new(reservations).basic
  end

  def show
    reservation = Reservations::Repository.new.find_by(params[:id])
    render json: Reservations::Representer.new([reservation]).extended
  end

  def update
    reservation = Reservations::UseCases::Update.new.call(id: params[:id], params: reservation_params)
    if reservation.valid?
      render json: reservation
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Reservations::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create
    @reservation = Reservations::UseCases::Create.new.call(params: reservation_params)

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
