# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let(:params) do
    { course: {
      title: 'Docker',
      description: 'learn about docker',
      start_date: '22/04/2020',
      end_date: '21/06/2021'
    } }
  end
  describe 'GET courses#index' do
    it 'should get index' do
      get courses_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST courses#create' do
    it 'should create new course with valid attributes' do
      post '/courses', params: params.to_json, headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
      expect(json['title']).to eq('Docker')
    end
  end

  describe 'PUT courses#update' do
    fixtures :courses
    it 'should update the bio' do
      new_course_params = { course: {
        title: 'Java',
        description: 'learn about java language in detail',
        start_date: '21/03/2020',
        end_date: '30/10/2021'
      } }

      put "/courses/#{courses.first.id}", params: new_course_params.to_json,
                                          headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(json['description']).to eq('learn about java language in detail')
    end
  end

  describe 'GET courses#show' do
    fixtures :courses
    it 'renders a successful response' do
      get course_url(courses)
      expect(response).to be_successful
    end
  end

  describe 'DELETE courses#destroy' do
    fixtures :courses
    it 'removes course from table' do
      delete "/courses/#{courses.first.id}", params: params.to_json,
                                             headers: { "Content-Type": 'application/json' }
      json = JSON.parse(response.body)
      expect(json['message']).to eq('Course is successfully destroyed')
    end
  end
end
