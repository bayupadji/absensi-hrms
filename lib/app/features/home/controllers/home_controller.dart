import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectIndex = 0.obs;
  PageController pageController = PageController();

  void onItemTap(int index) {
    selectIndex.value = index;
    pageController.jumpToPage(index);
    update();
  }
}
