import 'dart:async';
import 'dart:math';

import 'package:emotiary/models/diary.dart';
import 'package:emotiary/services/api_provider.dart';
import 'package:emotiary/services/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPageController extends GetxController with StateMixin {
  late ApiProvider apiProvider;
  EmoitalyToast _emoitalyToast = EmoitalyToast();

  TextEditingController ipInputController = TextEditingController();


  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();

    apiProvider = Get.find<ApiProvider>();
  }

  setIPSetting() async {
    apiProvider.apiUrl = ipInputController.text;

    _emoitalyToast.showToast("정상적으로 IP주소를 변경하였습니다!");

    Get.back();
  }
}
