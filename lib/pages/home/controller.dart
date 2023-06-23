import 'dart:async';
import 'dart:math';

import 'package:emotiary/models/diary.dart';
import 'package:emotiary/services/api_provider.dart';
import 'package:emotiary/services/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  late ApiProvider _apiProvider;
  EmoitalyToast _emoitalyToast = EmoitalyToast();

  RxList<Diary> diaryData = [].cast<Diary>().obs;


  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();

    _apiProvider = Get.find<ApiProvider>();
  }

  getDiaryList() async {
    Map responseData = await _apiProvider.getDiaryList();

    if (responseData['success']) {
      diaryData.value = (responseData['content'] as List).cast<Diary>();
    } else { _emoitalyToast.showToast("정상적으로 정보를 불러오는데 실패했습니다."); }


    return responseData;
  }

  removeDiary(String id) async {
    Map responseData = await _apiProvider.removeDiary(id);

    if (responseData['success']) {
      getDiaryList();
      _emoitalyToast.showToast("정상적으로 일기를 삭제하였습니다.");
    } else { _emoitalyToast.showToast("정상적으로 일기를 삭제하는데 실패했습니다."); }


    return responseData;
  }
}
