import 'dart:async';
import 'dart:math';

import 'package:emotiary/models/diary.dart';
import 'package:emotiary/services/api_provider.dart';
import 'package:emotiary/services/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritingPageController extends GetxController with StateMixin {
  late ApiProvider _apiProvider;
  EmoitalyToast _emoitalyToast = EmoitalyToast();

  TextEditingController titleInputController = TextEditingController();
  TextEditingController messageInputController = TextEditingController();
  Rx<EmojiType> selectEmoji = EmojiType.happy.obs;


  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();

    _apiProvider = Get.find<ApiProvider>();
  }

  uploadTodayDiary() async {
    Map responseData = await _apiProvider.uploadDailyDiary(
        titleInputController.text,
        selectEmoji.value,
        messageInputController.text
    );

    if (responseData['success']) {
      _emoitalyToast.showToast("성공적으로 일기를 등록하였습니다!");
      Get.back();
    } else { _emoitalyToast.showToast("정상적으로 일기를 등록하는데 실패했습니다."); }


    return responseData;
  }

  modifyTodayDiary(String id) async {
    Map responseData = await _apiProvider.modifyDiary(
        id,
        titleInputController.text,
        selectEmoji.value,
        messageInputController.text
    );

    if (responseData['success']) {
      _emoitalyToast.showToast("성공적으로 일기를 수정하였습니다!");
      Get.back();
    } else { _emoitalyToast.showToast("정상적으로 일기를 수정하는데 실패했습니다."); }


    return responseData;
  }
}
