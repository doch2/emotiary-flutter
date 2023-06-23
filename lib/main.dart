import 'dart:async';

import 'package:dio/dio.dart';
import 'package:emotiary/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<Dio>(Dio(), permanent: true);
  Get.put<ApiProvider>(ApiProvider(), permanent: true);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);


  runApp(
    GetMaterialApp(
      title: 'Emoti-ary',
      initialRoute: PageRoutes.LANDING,
      getPages: HumapPages.pages,
      debugShowCheckedModeBanner: false
    ),
  );
}