import 'package:get/get.dart';

import 'controller.dart';

class ReadingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingPageController>(() => ReadingPageController());
  }
}
