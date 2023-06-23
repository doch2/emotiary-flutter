import 'package:get/get.dart';

import 'controller.dart';

class WritingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WritingPageController>(() => WritingPageController());
  }
}
