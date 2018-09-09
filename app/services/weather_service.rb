class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org'

  def initialize(app_id, units = 'imperial')
    @options = { appid: app_id, units: units }
  end

  def weather(params = {})
    Rails.cache.fetch(cache_key(params), expires_in: 1.hour) do
      Rails.logger.info "Generating cache for #{params.inspect} in #{@units}"
      map_response(
        self.class.get(
          '/data/2.5/weather',
          query: params.merge(@options)
        )
      )
    end
  end

  private

  def cache_key(params)
    return "weather/#{params.fetch(:q)}_#{@units}" unless params.fetch(:q, '').blank? 
    "weather/#{params.fetch(:lat)}_#{params.fetch(:lon)}_#{@units}"
  end

  def map_response(response)
    {
      status: response.code,
      body: response.parsed_response
    }
  end
end
