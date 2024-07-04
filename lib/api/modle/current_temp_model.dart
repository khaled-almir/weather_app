class CurrentWeatherModel {
   String location ;
   double temperature ;
   int clouds ;
   int humidity ;
   double wind ;
   String icon ;
   String main ;

   CurrentWeatherModel({
     required this.location,
     required this.temperature,
     required this.clouds,
     required this.humidity,
     required this.wind,
     required this.icon,
     required this.main,
   });


   factory CurrentWeatherModel.fromJson(Map<String, dynamic> json ){
     return CurrentWeatherModel(
      location: json[ 'name'],
      temperature: json['main']['temp'],
      clouds :json["clouds"]["all"],
      humidity :json["main"]["humidity"],
      wind :json["wind"]["speed"],
      icon :json["weather"][0]["icon"],
      main :json["weather"][0]["main"],

     );
   }


}