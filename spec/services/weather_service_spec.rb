require 'rails_helper'

describe WeatherService do
  include WeatherMock

  subject(:service) { described_class.new(3) }
  describe '#weather' do
    before { weather_mock(city, desired_code) }

    context 'with a valid city' do
      let(:city) { 'A valid city' }
      let(:desired_code) { 200 }

      it 'responds with 200' do
        expect(service.weather(city).code).to be(200)
      end
    end

    context 'with a non existing city' do
      let(:city) { 'A non existing city' }
      let(:desired_code) { 404 }

      it 'responds with 404' do
        expect(service.weather(city).code).to be(404)
      end
    end
  end
end
