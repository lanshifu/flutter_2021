import 'package:get/get.dart';

class MainController extends GetxController{

  /// 1、申明变量
  var count = 0.obs;

  void add(){
    count ++;
    update();
  }
}