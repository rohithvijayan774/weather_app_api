class Weather {
  final double temperatureC;
  final double feelsLikeC;
  final String condition;
  final String name;
  final String localTime;
  final String region;
  final String country;
  final double windKph;
  final int humidity;
  final int isDay;

  Weather({
    this.temperatureC = 0,
    this.feelsLikeC = 0,
    this.condition = '',
    this.name = '',
    this.localTime = '',
    this.region = '',
    this.country = '',
    this.windKph = 0,
    this.humidity = 0,
    this.isDay = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      localTime: json['location']['localtime'],
      name: json['location']['name'],
      temperatureC: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      region: json['location']['region'],
      country: json['location']['country'],
      feelsLikeC: json['current']['feelslike_c'],
      windKph: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      isDay: json['current']['is_day'],
    );
  }
}
