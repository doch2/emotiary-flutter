import 'package:get/get.dart';

import 'controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
