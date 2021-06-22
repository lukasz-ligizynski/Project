# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets requests' do
  describe 'GET /tickets' do
    let!(:ticket) { build(:ticket) }

    it 'works and return status 200' do
      get('/tickets')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /tickets/:id' do
    let!(:ticket) { build(:ticket) }

    it 'works and return status 200' do
      get("/tickets/#{ticket.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /tickets' do
    let(:reservation) { create(:reservation) }
    it 'works and return status 201' do
      post('/tickets',
           params: { ticket: {
             ticket_type: 'normal',
             price: 25,
             seat: '2F',
             reservation_id: reservation.id
           } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /tickets/:id' do
    let!(:ticket) { create(:ticket) }

    it 'works and return status 200' do
      put("/tickets/#{ticket.id}", params: { ticket: { id: ticket.id, ticket_type: 'normal' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /tickets/:id' do
    let!(:ticket) { create(:ticket) }

    it 'works and return status 200' do
      delete("/tickets/#{ticket.id}")
      expect(response.status).to eq(200)
    end
  end
end
