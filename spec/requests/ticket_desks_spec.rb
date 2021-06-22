# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ticket_desks requests' do
  describe 'GET /ticket_desks' do
    let!(:ticket_desk) { build(:ticket_desk) }

    it 'works and return status 200' do
      get('/ticket_desks')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /ticket_desks/:id' do
    let!(:ticket_desk) { build(:ticket_desk) }

    it 'works and return status 200' do
      get("/ticket_desks/#{ticket_desk.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /ticket_desks' do
    it 'works and return status 201' do
      post('/ticket_desks', params: { ticket_desk: { offline: false } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /ticket_desks/:id' do
    let!(:ticket_desk) { create(:ticket_desk) }

    it 'works and return status 200' do
      put("/ticket_desks/#{ticket_desk.id}", params: { ticket_desk: { id: ticket_desk.id, offline: false } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /ticket_desks/:id' do
    let!(:ticket_desk) { create(:ticket_desk) }

    it 'works and return status 200' do
      delete("/ticket_desks/#{ticket_desk.id}")
      expect(response.status).to eq(200)
    end
  end
end
