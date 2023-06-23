import 'package:emotiary/themes/text_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/diary.dart';
import '../../themes/color_theme.dart';
import 'controller.dart';

class WritingPage extends GetView<WritingPageController> {
  const WritingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map argumentData = Get.arguments;
    bool isCreate = argumentData['mode'] == "create";

    if (!isCreate) {
      controller.titleInputController.text = (argumentData['data'] as Diary).title!;
      controller.messageInputController.text = (argumentData['data'] as Diary).message!;
      controller.selectEmoji.value = (argumentData['data'] as Diary).emoji!;
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                  Text("오늘의 일기 ${isCreate ? "작성" : "수정"}하기", style: listTitle),
                  const SizedBox(height: 36),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("하루를 종합한 나만의 감정을 선택해요\n(원하는 감정을 눌러보세요!)", textAlign: TextAlign.center, style: description),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getEmotionSelectWidget(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  getInputTextField("제목쓰기", inputTextFieldText.copyWith(fontSize: 26), controller.titleInputController),
                  const SizedBox(height: 16),
                  getInputTextField("오늘 하루를 간단히 요약하자면?", inputTextFieldText, controller.messageInputController),
                ],
              ),
              Positioned(
                bottom: 24,
                child: GestureDetector(
                  onTap: () => (isCreate ? controller.uploadTodayDiary() : controller.modifyTodayDiary((argumentData['data'] as Diary).id!)),
                  child: Container(
                    width: 180,
                    height: 55,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(child: Text("${isCreate ? "등록" : "수정"}하기 📝", style: smallBtn.copyWith(color: Colors.white, fontSize: 20))),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox getInputTextField(String hintText, TextStyle textStyle, TextEditingController textController) {
    return SizedBox(
      width: 330,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: textController,
        textAlign: TextAlign.center,
        style: textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
          fillColor: Colors.indigoAccent.withAlpha(20),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 0, style: BorderStyle.none,)),
          hintText: hintText,
        ),
      ),
    );
  }

  List<Widget> getEmotionSelectWidget() {
    List<Widget> result = [].cast<Widget>();

    for (EmojiType emojiType in EmojiType.values.sublist(0, EmojiType.values.length-1)) {
      result.add(
        GestureDetector(
          onTap: () => controller.selectEmoji.value = emojiType,
          child: Obx(() => ExtendedImage.asset(
              "assets/images/${emojiType.ENG}.png",
              width: (controller.selectEmoji.value == emojiType ? 64 : 48),
          )),
        )
      );

      result.add(const SizedBox(width: 18));
    }

    result.removeAt(result.length-1);

    return result;
  }
}





