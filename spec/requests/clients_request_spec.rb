# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients requests' do
  describe 'GET /clients' do
    let!(:client) { build(:client) }

    it 'works and return status 200' do
      get('/clients')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /clients/:id' do
    let!(:client) { build(:client) }

    it 'works and return status 200' do
      get("/clients/#{client.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /clients' do
    it 'works and return status 201' do
      post('/clients', params: { client: { name: 'Some name', age: 18, email: 'example@ex.com', real_user: true } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /clients/:id' do
    let!(:client) { create(:client) }

    it 'works and return status 200' do
      put("/clients/#{client.id}", params: { client: { name: 'Some name', age: 18, email: 'example@ex.com', real_user: true } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /clients/:id' do
    let!(:client) { create(:client) }

    it 'works and return status 200' do
      delete("/clients/#{client.id}")
      expect(response.status).to eq(200)
    end
  end
end
