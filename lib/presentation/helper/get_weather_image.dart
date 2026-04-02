String getWeatherImage(String condition) {
  final c = condition.toLowerCase();

  // Clear / Sunny
  if (c.contains('sunny') || c.contains('clear')) {
    return 'assets/images/clear.png';
  }
  // Cloudy / Fog / Mist
  else if (c.contains('cloud') ||
      c.contains('overcast') ||
      c.contains('mist') ||
      c.contains('fog')) {
    return 'assets/images/cloudy.png';
  }
  // Rain / Drizzle / Sleet
  else if (c.contains('rain') || c.contains('drizzle') || c.contains('sleet')) {
    return 'assets/images/rainy.png';
  }
  // Snow / Ice
  else if (c.contains('snow') || c.contains('ice') || c.contains('blizzard')) {
    return 'assets/images/snow.png';
  }
  // Thunderstorm
  else if (c.contains('thunder')) {
    return 'assets/images/thunderstorm.png';
  }
  // Default
  else {
    return 'assets/images/clear.png';
  }
}
