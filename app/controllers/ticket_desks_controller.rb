# frozen_string_literal: true

class TicketDesksController < ApplicationController
  def index
    ticket_desks = TicketDesks::Repository.new.find_all
    render json: TicketDesks::Representer.new(ticket_desks).basic
  end

  def show
    ticket_desk = TicketDesks::Repository.new.find_by(params[:id])
    render json: TicketDesks::Representer.new([ticket_desk]).extended
  end

  def update
    ticket_desk = TicketDesks::UseCases::Update.new.call(id: params[:id], params: ticket_desk_params)
    if ticket_desk.valid?
      render json: ticket_desk
    else
      render json: ticket_desk.errors, status: :unprocessable_entity
    end
  end

  def destroy
    TicketDesks::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create
    @ticket_desk = TicketDesks::UseCases::Create.new.call(params: ticket_desk_params)

    if @ticket_desk.valid?
      render json: @ticket_desk, status: :created, location: @ticket_desk
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end
  end

  private

  def ticket_desk_params
    params.require(:ticket_desk).permit(:offline)
  end
end
