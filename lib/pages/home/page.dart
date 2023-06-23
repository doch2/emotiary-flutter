import 'package:emotiary/routes/routes.dart';
import 'package:emotiary/themes/text_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/diary.dart';
import '../../themes/color_theme.dart';
import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getDiaryList();

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
                right: 24,
                child: Row(
                  children: [
                    Text("구동을 위해 서버 IP주소를 설정하려면 ->", style: description_handWriting.copyWith(fontSize: 16)),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Get.toNamed(PageRoutes.SETTING),
                      child: const Icon(Icons.settings),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("작성한 일기 모음", style: listTitle),
                  const SizedBox(height: 8),
                  Text(
                    "박스를 살짝 누르면 내용을 더욱 자세하게 볼 수 있고,\n꾸욱 누르면 일기가 없어진답니다 :)",
                    style:description_handWriting,
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 32),
                  Obx(() => SizedBox(
                    height: 350,
                    width: 280,
                    child: SizedBox(
                      width: 260,
                      child: ListView.builder(
                        itemCount: controller.diaryData.length,
                        itemBuilder: (BuildContext context, int index) {
                          Diary diaryData = controller.diaryData[index];

                          return GestureDetector(
                            onTap: () => Get.toNamed(PageRoutes.READING, arguments: diaryData),
                            onLongPress: () => controller.removeDiary(diaryData.id!),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(20),
                                    blurRadius: 10,
                                    spreadRadius: 5
                                  )
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ExtendedImage.asset("assets/images/${diaryData.emoji!.ENG}.png", width: 32),
                                      const SizedBox(width: 8),
                                      Text((diaryData.title!.length < 14 ? diaryData.title! : "${diaryData.title!.substring(0, 13)}.."), style: list_diaryTitle)
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Text(diaryData.message!, style: list_diarymessage),
                                  const SizedBox(height: 10),
                                  Text(diaryData.date!.toString().substring(0, 10), style: list_diarymessage.copyWith(fontSize: 15)),
                                ],
                              ),
                            ),
                          );
                        },

                      ),
                    ),
                  )),
                ],
              ),
              Positioned(
                  bottom: 100,
                  child: GestureDetector(
                    onTap: () => controller.getDiaryList(),
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(child: Text("일기 새로고침하기", style: smallBtn.copyWith(color: Colors.white, fontSize: 14))),
                    ),
                  )
              ),
              Positioned(
                bottom: 24,
                child: GestureDetector(
                  onTap: () => Get.toNamed(PageRoutes.WRITING, arguments: {"mode": "create"}),
                  child: Container(
                    width: 180,
                    height: 55,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(child: Text("오늘의 일기 쓰러가기 📝", style: smallBtn.copyWith(color: Colors.white))),
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





