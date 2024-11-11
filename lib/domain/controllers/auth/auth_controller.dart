import 'package:get/get.dart';

class AuthController extends GetxController{
  void onMove(){
    Get.offNamed('/home');
  }
}