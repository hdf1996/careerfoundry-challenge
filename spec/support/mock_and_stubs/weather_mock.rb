module WeatherMock
  def weather_mock(city, status_code)
    stub_request(:any, %r{.*/data/2.5/weather})
      .with(query: hash_including({ q: city }))
      .to_return(
        body: File.open(file_fixture('successful_response.json')),
        status: status_code
      )
  end
end