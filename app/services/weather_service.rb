class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org'

  def initialize(app_id)
    @options = { appid: app_id }
  end

  def weather(location, units = 'imperial')
    Rails.cache.fetch("weather/#{location}_#{units}", expires_in: 12.hours) do
      Rails.logger.info "Generating cache for #{location} in #{units}"
      map_response(
        self.class.get(
          '/data/2.5/weather',
          query: @options.merge(q: location, units: units)
        )
      )
    end
  end

  private

  def map_response(response)
    {
      status: response.code,
      body: response.parsed_response
    }
  end
end
