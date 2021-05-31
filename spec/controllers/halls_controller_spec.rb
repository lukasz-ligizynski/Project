require 'rails_helper'

RSpec.describe HallsController, type: :controller do
  describe 'GET #show' do
    let(:hall) { Hall.create(name: 'Some name', capacity: 500) }
    it 'works and return status 200' do
      get :show, params: { id: hall.id }
      ​
      expect(response.status).to eq(200)
    end
  end
  ​
  describe 'GET #index' do
    before { Hall.create(name: 'Some namgie', capacity: 500) }
    it 'works and return status 200' do
      get :index
      ​
      expect(response.status).to eq(200)
    end
  end
  ​
  describe 'POST #create' do
    it 'works and return status 201' do
      post :create, params: { name: 'new name', capacity: 100 }
      ​
      expect(response.status).to eq(201)
    end
  end
  ​
  describe 'PUT #update' do
    let(:hall) { Hall.create(name: 'Some name', capacity: 500) }
    ​
    it 'works and return status 200' do
      put :create, params: { id: hall.id, name: 'new name' }
      ​
      expect(response.status).to eq(200)
    end
  end
end
