module Api
  module V1
    class WeatherController < ApplicationController
      def index
        weather = weather_service.weather(
          params.require(:q),
          params.fetch(:units, 'imperial')
        )
        if weather[:status] == 404
          render json: { error: :not_found }, status: :not_found
        else
          render json: weather[:body]
        end
      end

      private

      def weather_service
        @weather_service ||= WeatherService.new(
          Rails.application.secrets.open_weather_app_id
        )
      end
    end
  end
end
