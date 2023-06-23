import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../routes/routes.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Swiper(
          itemBuilder: (BuildContext context, int index){
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(width: Get.width, height: Get.height),
                Positioned(
                  top: Get.height * 0.2,
                  child: pageTextWidget(index+1),
                ),
                Positioned(
                  top: Get.height * 0.3,
                  child: SizedBox(
                    height: Get.height * 0.5,
                    child: Center(child: pageContentWidget(index+1)),
                  ),
                ),
                Positioned(
                  bottom: (index!=2 ? -500 : 46),
                  child: GestureDetector(
                    onTap: () => Get.offAndToNamed(PageRoutes.HOME),
                    child: Container(
                      width: 85,
                      height: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(child: Text("시작하기", style: smallBtn.copyWith(color: Colors.white))),
                    ),
                  )
                )
              ],
            );
          },
          loop: false,
          itemCount: 3,
          pagination: SwiperPagination(
              margin: EdgeInsets.only(bottom: Get.height * 0.17),
              builder: SwiperCustomPagination(builder: (context, config) {
                return SizedBox(
                  width: 70,
                  height: 10,
                  child: ListView.builder(
                    itemCount: config.itemCount,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ConstrainedBox(
                      constraints: BoxConstraints.expand(width: 20),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (config.activeIndex == index) ? mainColor : Colors.white,
                            border: Border.all(color: ((config.activeIndex != index) ? mainColor : Colors.transparent), width: 1)
                        ),
                      ),
                    ),
                  ),
                );
              })
          ),
        ),
      ),
    );
  }

  pageTextWidget(int index) {
    switch (index) {
      case 1: return Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "우리는 ",
                style: landingPage_title
            ),
            TextSpan(
              text: "우리만의 발자취",
              style: landingPage_title.copyWith(color: mainColor)
            ),
            TextSpan(
                text: "를 남기기 위해\n",
                style: landingPage_title
            ),
            TextSpan(
                text: "하루가 끝난 후 일기를 써요"
            )
          ],
        ),
        textAlign: TextAlign.center,
        style: landingPage_title,
      );
      case 2: return Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "그러나.. 글로 정리하기에는\n"
            ),
            TextSpan(
                text: "매우 귀찮죠 😪",
                style: landingPage_title.copyWith(color: mainColor)
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: landingPage_title,
      );
      case 3: return Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "이제는 감정표현을 통해\n"
            ),
            TextSpan(
                text: "간단하고 재미있게 ",
                style: landingPage_title.copyWith(color: mainColor)
            ),
            TextSpan(
                text: "일기를 써봐요 🥳"
            )
          ],
        ),
        textAlign: TextAlign.center,
        style: landingPage_title,
      );

    }
  }

  pageContentWidget(int index) {
    switch (index) {
      case 1: return LottieBuilder.asset("assets/lotties/read_book.json", width: Get.width * 0.8);
      case 2: return LottieBuilder.asset("assets/lotties/tired_person.json", width: Get.width * 0.8);
      case 3: return LottieBuilder.asset("assets/lotties/emotion_person.json", width: Get.width * 0.8);
    }
  }
}