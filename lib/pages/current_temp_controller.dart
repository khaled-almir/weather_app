import 'package:weather/api/modle/current_temp_model.dart';
import 'package:get/get.dart';
import 'package:weather/api/services/api_services.dart';
//import 'package:location/location.dart';
class CurrentTempController extends GetxController{
  ApiServices apiServices = ApiServices();
 // var location = Location();

  var currentWeather = CurrentWeatherModel(
    location: '',
    temperature: 0.0,
    clouds: 0,
    humidity: 0,
    wind: 0.0,
    icon:' ',
    main: ' ',
  ).obs;

  var isLoading = true.obs ;
  //LocationData? locationData;
  @override
  onInit(){
    super.onInit();
    fetchWeather('beirut');
  }

  void fetchWeather(String location ) async {
    try {
      isLoading(true);
      var data = await apiServices.get(location);
      currentWeather.value = CurrentWeatherModel.fromJson(data);
      print('image ${currentWeather.value.icon}');
    }catch(e){
      print('Error1: $e');
  }finally{
    isLoading(false);
  }
  }
  // Future<void> fetchLocation() async{
  //   Location location = new Location();
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //    serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled){
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled){
  //       return;
  //     }
  //   }
  //   permissionGranted = await location.hasPermission();
  //   if(permissionGranted == PermissionStatus.denied){
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted){
  //       return;
  //     }
  // }
  //    locationData = await location.getLocation();
  //   print('locationData ${locationData!.latitude}');
  //   print('locationData ${locationData!.altitude}');
  //
  // }


}