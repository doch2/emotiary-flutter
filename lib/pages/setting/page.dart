import 'package:emotiary/themes/text_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/diary.dart';
import '../../themes/color_theme.dart';
import 'controller.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  Text("서비스 설정하기", style: listTitle),
                  const SizedBox(height: 48),
                  getInputTextField("서버 IP 입력하기", inputTextFieldText, controller.ipInputController),
                  const SizedBox(height: 16),
                  Text("정확히 예시에 따라 맞춰 써주세요!\n예시: http://172.153.24.23:3000", style: description.copyWith(fontWeight: FontWeight.w400), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Text("현재 설정되어있는 IP: ${controller.apiProvider.apiUrl}", style: description.copyWith(fontWeight: FontWeight.w300, color: Colors.black), textAlign: TextAlign.center),

                ],
              ),
              Positioned(
                bottom: 24,
                child: GestureDetector(
                  onTap: () => controller.setIPSetting(),
                  child: Container(
                    width: 180,
                    height: 55,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(child: Text("설정 적용하기", style: smallBtn.copyWith(color: Colors.white, fontSize: 20))),
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
}





