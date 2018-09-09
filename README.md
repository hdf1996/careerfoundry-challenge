[![Build Status](https://travis-ci.org/hdf1986/careerfoundry-challenge.svg?branch=master)](https://travis-ci.org/hdf1986/careerfoundry-challenge)
# WeatherApp

This app uses OpenWeatherMap to show a nice & detailed view of your local weather!

- Ruby version: 2.5.1

- Configuration
  - Set OPEN_WEATHER_APP_ID to a valid api token (create yours at https://openweathermap.org/)
  - Set up redis with the default settings
  - Set up postgresql (you can find the credentials at config/database.yml)

- Database creation
  - rails db:create

- Database initialization
  - rails db:migrate

- How to run the test suite
  - bundle exec rspec
  - bundle exec rubocop app spec -Ra

- Deployment instructions
  - Just push to hdf1986/careerfoundry-challenge master branch and you are done!

## Things to improve
- Use scss & javascript linting
- Separate the API from the frontend into two apps
- Create integration tests for the frontend
- Build a smooth transition for the background
- Integrate with Google maps API to build an input with suggestions about the locations while the user is tiping