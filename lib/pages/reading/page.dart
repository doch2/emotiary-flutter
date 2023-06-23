import 'package:emotiary/themes/text_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/diary.dart';
import '../../themes/color_theme.dart';
import '../../routes/routes.dart';
import 'controller.dart';

class ReadingPage extends GetView<ReadingPageController> {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Diary diaryData = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(width: Get.width, height: Get.height),
              Positioned(
                top: 16,
                left: 24,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("오늘의 일기", style: listTitle.copyWith(fontFamily: "korailRoundGothic", fontSize: 32, fontWeight: FontWeight.w300)),

                  const SizedBox(height: 36),
                  Text(diaryData.title!, style: description_handWriting.copyWith(fontSize: 32)),
                  const SizedBox(height: 16),
                  Text(diaryData.message!, style: description_handWriting.copyWith(fontSize: 24)),
                  const SizedBox(height: 48),
                  ExtendedImage.asset(
                    "assets/images/${diaryData.emoji!.ENG}.png",
                    width: 84,
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                child: GestureDetector(
                  onTap: () => Get.offAndToNamed(PageRoutes.WRITING, arguments: {
                    "mode": "modify",
                    "data": diaryData
                  }),
                  child: Container(
                    width: 180,
                    height: 55,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(child: Text("수정하러가기 📝", style: smallBtn.copyWith(color: Colors.white, fontSize: 20))),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}





