require 'rails_helper'

RSpec.describe "API Developers", type: :request do
  describe 'GET /api/v1/developers' do
    let!(:developers) { create_list(:developer, 100) }

    before { get '/api/v1/developers' }

    it 'return success status' do
      expect(response).to be_success
    end

    it 'return correct data' do
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(100)
    end
  end
end