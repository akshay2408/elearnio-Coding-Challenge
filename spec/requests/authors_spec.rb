require 'rails_helper'

RSpec.describe "Authors", type: :request do
  let(:params) { { author: {
                              first_name: 'John',
                              last_name: 'Doe',
                              bio: 'hello i am an author',
                              dob: '21/06/1995'
                            }} }
  describe "GET authors#index" do
    it "should get index" do
      get authors_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST authors#create" do
    it "should create new author with valid attributes" do
      post '/authors', :params => params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
      expect(json['bio']).to eq("hello i am an author")
    end
  end

  describe "PUT authors#update" do
    fixtures :authors
    it "should update the bio" do

      new_author_params = { author: {
        first_name: 'john',
        last_name: 'stark',
        bio: 'an author of this course',
        dob:'22/04/1991'
      }}

      put "/authors/#{authors.first.id}", :params => new_author_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(json['bio']).to eq("an author of this course")
    end
  end

  describe "GET authors#show" do
    fixtures :authors
    it "renders a successful response" do
      get author_url(authors)
      expect(response).to be_successful
    end
  end

  describe "DELETE authors#destroy" do
    fixtures :authors
    it 'removes author from table' do
      delete "/authors/#{authors.first.id}", :params => params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(json['message']).to eq("Author is successfully destroyed")
    end
  end

end
