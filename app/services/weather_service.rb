class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org'

  def initialize(app_id)
    @options = { appid: app_id }
  end

  def weather(city)
    self.class.get(
      '/data/2.5/weather',
      query: @options.merge(q: city)
    )
  end
end
