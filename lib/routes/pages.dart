import 'package:emotiary/pages/landing/page.dart';
import 'package:emotiary/pages/reading/binding.dart';
import 'package:emotiary/pages/reading/page.dart';
import 'package:emotiary/pages/setting/binding.dart';
import 'package:emotiary/pages/setting/page.dart';
import 'package:emotiary/pages/writing/binding.dart';
import 'package:emotiary/pages/writing/page.dart';
import 'package:get/get.dart';

import '../pages/home/binding.dart';
import '../pages/home/page.dart';
import 'routes.dart';

class HumapPages {
  static final pages = [
    GetPage(name: PageRoutes.HOME, page: () => const HomePage(), binding: HomePageBinding(), transition: Transition.noTransition),
    GetPage(name: PageRoutes.LANDING, page: () => const LandingPage()),
    GetPage(name: PageRoutes.WRITING, page: () => const WritingPage(), binding: WritingPageBinding()),
    GetPage(name: PageRoutes.READING, page: () => const ReadingPage(), binding: ReadingPageBinding()),
    GetPage(name: PageRoutes.SETTING, page: () => const SettingPage(), binding: SettingPageBinding()),
  ];
}
