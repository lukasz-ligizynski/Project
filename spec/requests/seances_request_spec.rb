# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Seances requests' do
  describe 'GET /seances' do
    let!(:seance) { build(:seance) }

    it 'works and return status 200' do
      get('/seances')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /seances/:id' do
    let!(:seance) { build(:seance) }

    it 'works and return status 200' do
      get("/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /seances' do
    let(:movie) { create(:movie) }
    let(:hall) { create(:hall) }

    it 'works and return status 201' do
      post('/seances',
           params: { seance: {
             seance_date: DateTime.parse('12/06/2021 5:00'),
             duration: 120,
             movie_id: movie.id,
             hall_id: hall.id
           } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /seances/:id' do
    let!(:seance) { create(:seance) }

    it 'works and return status 200' do
      put("/seances/#{seance.id}",
          params: { seance: { id: seance.id, duration: 120 } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /seances/:id' do
    let!(:seance) { create(:seance) }

    it 'works and return status 200' do
      delete("/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end
end
