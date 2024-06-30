import 'package:weather/api/modle/current_temp_model.dart';
import 'package:get/get.dart';
import 'package:weather/api/services/api_services.dart';

class CurrentTempController extends GetxController{
  ApiServices apiServices = ApiServices();
  var currentWeather = CurrentWeatherModel(
    location: '',
    temperature: 0.0,
    clouds: 0,
    humidity: 0,
    wind: 0.0,
  ).obs;

  var isLoading = true.obs ;

  @override
  onInit(){
    super.onInit();
    fetchWeather();
  }
  void fetchWeather() async {
    try {
      isLoading(true);
      var data = await apiServices.get();
      currentWeather.value = CurrentWeatherModel.fromJson(data);
    }catch(e){
      print('Error1: $e');
  }finally{
    isLoading(false);
  }
  }




}