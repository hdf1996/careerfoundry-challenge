require 'rails_helper'
include WeatherMock

describe Api::V1::WeatherController, type: :controller do
  describe '#index' do
    before do
      weather_mock(q, desired_weather_status_code)
      get :index, params: { q: q }
    end

    context 'without query param' do
      let(:q) { nil }
      let(:desired_weather_status_code) { 404 }

      it 'returns a bad request' do
        expect(response).to have_http_status(:bad_request)
      end
      it 'returns an error field' do
        expect(response_body).to have_key('error')
      end
    end

    context 'with an invalid city' do
      let(:q) { 'Zudan, Azar' }
      let(:desired_weather_status_code) { 404 }

      it 'returns not found' do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns empty response' do
        expect(response_body).to have_key('error')
      end
    end

    context 'with a valid city' do
      let(:q) { 'London, uk' }
      let(:desired_weather_status_code) { 200 }

      it 'returns 200 ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'returns the minimum temperature' do
        expect(response_body['main']).to have_key('temp_min')
      end
      it 'returns the maximum temperature' do
        expect(response_body['main']).to have_key('temp_max')
      end
      it 'returns the description' do
        expect(response_body['weather'].first).to have_key('description')
      end
      it 'returns the name' do
        expect(response_body).to have_key('name')
      end
    end
  end
end
