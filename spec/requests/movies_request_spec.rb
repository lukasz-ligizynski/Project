# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies requests' do
  describe 'GET /movies' do
    let!(:movie) do
      Movie.create(title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                   genre: 'some genre')
    end

    it 'works and return status 200' do
      get('/movies')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /movies/:id' do
    let!(:movie) do
      Movie.create(title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                   genre: 'some genre')
    end

    it 'works and return status 200' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /movies' do
    it 'works and return status 201' do
      post('/movies',
           params: { movie: { title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                              genre: 'some genre' } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /movies/:id' do
    let!(:movie) do
      Movie.create(title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                   genre: 'some genre')
    end

    it 'works and return status 200' do
      put("/movies/#{movie.id}",
          params: { movie: { id: movie.id, title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                             genre: 'some genre' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /movies/:id' do
    let!(:movie) do
      Movie.create(title: 'Some Title', duration: '120', adult_only: 0, description: 'Some description',
                   genre: 'some genre')
    end

    it 'works and return status 200' do
      delete("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end
end
