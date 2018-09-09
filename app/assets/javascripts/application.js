(function () {
  let currentTempType = 'metric';
  let location = 'London';
  const API_URL = '';
  // TODO: Get user location

  const weatherNameByCode = code => {
    console.log(code);
    if(200 <= code && code <= 299) return 'thunderstorm';
    if(300 <= code && code <= 399) return 'drizzle';
    // According to https://openweathermap.org/weather-conditions 4xx doesn't exist 
    if(500 <= code && code <= 599) return 'rain';
    if(600 <= code && code <= 699) return 'snow';
    if(700 <= code && code <= 799) return 'atmosphere';
    if(code === 800) return 'clear';
    if(800 < code && code <= 899) return 'clouds';
  }

  const addUnit = (str) => currentTempType === 'metric' ? `${str}°C` : `${str}°F` 

  const [
    containerElement,
    inputElement,
    locationElement,
    descriptionElement,
    temperatureElement,
    imperialElement,
    metricElement,
    weatherElement,
    feedbackElement
  ] = [
    '.container',
    '.input',
    '.location',
    '.description',
    '.temperature',
    '.imperial',
    '.metric',
    '.weather-container',
    '.feedback'
  ].map(query => document.querySelector(query))

  const fetchWeatherByName = (location) => fetch(`${API_URL}/api/v1/weather?q=${location}&units=${currentTempType}`)
  const fetchWeatherByPos = (lat, lon) => fetch(`${API_URL}/api/v1/weather?lat=${lat}&lon=${lon}&units=${currentTempType}`)

  const setUI = weather => {
    feedbackElement.classList.remove('enabled')
    const maxTemp = addUnit(weather.main['temp_max']);
    const minTemp = addUnit(weather.main['temp_min']);
    locationElement.innerHTML = weather.name
    descriptionElement.innerHTML = weather.weather[0].description
    temperatureElement.innerHTML = `${minTemp} - ${maxTemp}`
    containerElement.className = `container ${weatherNameByCode(parseInt(weather.weather[0].id))}`
  }

  const updateWeather = (res) => {
    weatherElement.classList.add('loading')
    document.querySelector('.temp-selector > .enabled').classList.remove('enabled');
    document.querySelector(`.${currentTempType}`).classList.add('enabled')

    if(res.status !== 200) return feedbackElement.classList.add('enabled');
    return res.json().then(weather => {
      setUI(weather)
      location = weather.name
      weatherElement.classList.remove('loading')
    });
  }

  const updateWeatherByName = (location) => fetchWeatherByName(location).then(res => updateWeather(res));
  const updateWeatherByPos = (lat, lon) => fetchWeatherByPos(lat, lon).then(res => updateWeather(res));

  const changeUnits = (unitType) => {
    currentTempType = unitType;
    updateWeather(location)
  }

  imperialElement.addEventListener('click', () => changeUnits('imperial'))
  metricElement.addEventListener('click', () => changeUnits('metric'))
  inputElement.parentNode.addEventListener('submit', (e) => {
    e.preventDefault();
    updateWeatherByName(inputElement.value)
  })

  updateWeather(location)

  try {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(function(position) {
        updateWeatherByPos(
          position.coords.latitude, 
          position.coords.longitude,
        );
      });
    }
  } catch (error) {
    console.log('s');
  }
})()