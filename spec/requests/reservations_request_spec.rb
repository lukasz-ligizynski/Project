# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reservations requests' do
  describe 'GET /reservations' do
    let!(:reservation) { build(:reservation) }

    it 'works and return status 200' do
      get('/reservations')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /reservations/:id' do
    let!(:reservation) { build(:reservation) }

    it 'works and return status 200' do
      get("/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations' do
    let!(:seance) { create :seance }
    let!(:client) { create :client }
    let!(:ticket_desk) { create :ticket_desk }

    it 'works and return status 201' do
      post('/reservations',
           params: { reservation: {
             status: 'created',
             client_id: client.id,
             seance_id: seance.id,
             ticket_desk_id: ticket_desk.id
           } })

      expect(response.status).to eq(201)
      puts(response.body)
    end
  end

  describe 'PUT /reservations/:id' do
    let!(:reservation) { create(:reservation) }

    it 'works and return status 200' do
      put("/reservations/#{reservation.id}", params: { reservation: { status: 'paid' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /reservations/:id' do
    let!(:reservation) { create(:reservation) }

    it 'works and return status 200' do
      delete("/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end
end
