# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Talents', type: :request do
  describe 'GET talents#index' do
    it 'should get index' do
      get talents_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST talents#create' do
    fixtures :talents
    it 'should create new talent with valid attributes' do
      post '/talents', params: talents.first.to_json,
                       headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
      expect(json['description']).to eq('java language')
    end
  end

  describe 'PUT talents#update' do
    fixtures :talents
    it 'should update the bio' do
      new_talent_params = { talent: {
        description: 'java language is a skill'
      } }

      put "/talents/#{talents.first.id}", params: new_talent_params.to_json,
                                          headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(json['description']).to eq('java language is a skill')
    end
  end

  describe 'GET talents#show' do
    fixtures :talents
    it 'renders a successful response' do
      get talent_url(talents)
      expect(response).to be_successful
    end
  end

  describe 'DELETE talents#destroy' do
    fixtures :talents
    it 'removes talent from table' do
      delete "/talents/#{talents.first.id}", params: talents.first.to_json,
                                             headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(json['message']).to eq('Talent is successfully destroyed')
    end
  end
end
