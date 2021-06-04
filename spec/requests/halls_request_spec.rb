# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Halls requests' do
  describe 'GET /halls' do
    let!(:hall) { build(:hall) }

    it 'works and return status 200' do
      get('/halls')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /halls/:id' do
    let!(:hall) { build(:hall) }

    it 'works and return status 200' do
      get("/halls/#{hall.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /halls' do
    it 'works and return status 201' do
      post('/halls', params: { hall: { name: 'Some name', capacity: 500 } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /halls/:id' do
    let!(:hall) { create(:hall) }

    it 'works and return status 200' do
      put("/halls/#{hall.id}", params: { hall: { id: hall.id, name: 'Some name', capacity: 500 } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /halls/:id' do
    let!(:hall) { create(:hall) }

    it 'works and return status 200' do
      delete("/halls/#{hall.id}")
      expect(response.status).to eq(200)
    end
  end
end
