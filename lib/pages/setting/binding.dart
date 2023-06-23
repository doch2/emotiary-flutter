import 'package:get/get.dart';

import 'controller.dart';

class SettingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingPageController>(() => SettingPageController());
  }
}
