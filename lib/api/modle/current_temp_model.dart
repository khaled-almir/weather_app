
class CurrentWeatherModel {
   String location ;
   double temperature ;
   double clouds ;
   double humidity ;
   double wind ;


   CurrentWeatherModel({
     required this.location,
     required this.temperature,
     required this.clouds,
     required this.humidity,
     required this.wind});

   factory CurrentWeatherModel.fromJson(Map<String, dynamic> json ){
     return CurrentWeatherModel(
      location: json[ 'name'],
      temperature: json['main']['temp'],
      clouds :json["clouds"]["all"],
      humidity :json["main"]["humidity"],
      wind :json["wind"]["speed"],
     );
   }


}