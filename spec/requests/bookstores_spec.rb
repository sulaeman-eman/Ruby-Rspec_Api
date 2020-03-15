require 'rails_helper'

RSpec.describe 'Bookstore API', type: :request do
  # initialize test data 
  let!(:bookstores) { create_list(:bookstore, 10) }
  let(:bookstore_id) { bookstores.first.id }

  # Test suite for GET /bookstores
  describe 'GET /bookstores' do
    # make HTTP get request before each example
    before { get '/bookstores' }

    it 'returns bookstores' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /bookstore/:id
  describe 'GET /bookstores/:id' do
    before { get "/bookstores/#{bookstore_id}" }

    context 'when the record exists' do
      it 'returns the bookstore' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(bookstore_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:bookstore_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Bookstore/)
      end
    end
  end

  # Test suite for POST /bookstores
  describe 'POST /bookstores' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', deskripsi: '1' } }

    context 'when the request is valid' do
      before { post '/bookstores', params: valid_attributes }

      it 'creates a bookstore' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/bookstores', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Deskripsi can't be blank/)
      end
    end
  end

  # Test suite for PUT /bookstores/:id
  describe 'PUT /bookstores/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/bookstores/#{bookstore_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /bookstores/:id
  describe 'DELETE /bookstores/:id' do
    before { delete "/bookstores/#{bookstore_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end