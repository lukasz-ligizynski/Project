# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    tickets = Tickets::Repository.new.find_all
    render json: Tickets::Representer.new(tickets).basic
  end

  def show
    ticket = Tickets::Repository.new.find_by(params[:id])
    render json: Tickets::Representer.new([ticket]).extended
  end

  def update
    ticket = Tickets::UseCases::Update.new.call(id: params[:id], params: ticket_params)
    if ticket.valid?
      render json: ticket
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Tickets::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create
    @ticket = Tickets::UseCases::Create.new.call(params: ticket_params)

    if @ticket.valid?
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:seat, :ticket_type,:price, :reservation_id)
  end
end
