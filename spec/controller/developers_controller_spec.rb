require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  describe 'GET #index' do
    let!(:dev1) { create(:developer) }
    let!(:dev2) { create(:developer) }
    let!(:dev3) { create(:developer) }
    let!(:english_language) { create(:language, code: 'en') }
    let!(:japanese_language) { create(:language, code: 'jp') }
    let!(:ruby_language) { create(:programming_language, name: 'ruby') }
    let!(:java_language) { create(:programming_language, name: 'java') }
    let!(:kotlin_language) { create(:programming_language, name: 'kotlin') }
    let!(:dev_lang1) { create(:developer_language, developer: dev1, language: english_language) }
    let!(:dev_lang2) { create(:developer_language, developer: dev2, language: japanese_language) }
    let!(:dev_lang3) { create(:developer_language, developer: dev3, language: japanese_language) }
    let!(:dev_pro_lang1) { create(:developer_programming_language, developer: dev1, programming_language: ruby_language) }
    let!(:dev_pro_lang2) { create(:developer_programming_language, developer: dev2, programming_language: ruby_language) }
    let!(:dev_pro_lang3) { create(:developer_programming_language, developer: dev3, programming_language: java_language) }

    describe 'when not search' do
      before { get :index }
      context 'return correct data' do
        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq 3
        end
      end
    end

    describe 'when search with programming language' do
      context 'return correct data' do
        before { get :index, params: {programming_language: 'ruby'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq 2
        end
      end

      context 'return empty data' do
        before { get :index, params: {programming_language: 'kotlin'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers)).to be_empty
        end
      end
    end

    describe 'when search with language' do
      context 'return correct data' do
        before { get :index, params: {language: 'en'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq 1
        end
      end

      context 'return empty data' do
        before { get :index, params: {language: 'vn'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers)).to be_empty
        end
      end
    end

    describe 'when search with programming language and language' do
      context 'return correct data' do
        before { get :index, params: {programming_language: 'ruby', language: 'en'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq 1
          expect(assigns(:developers).first).to eq dev1
        end
      end

      context 'return empty data' do
        before { get :index, params: {programming_language: 'java', language: 'en'} }

        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers)).to be_empty
        end
      end
    end
  end
end