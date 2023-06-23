import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../models/diary.dart';

class ApiProvider {
  String apiUrl = "http://172.16.10.75:3000";

  Dio _dio = Get.find<Dio>();

  getDiaryList() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/diary",
      );

      List originalData = response.data;
      List formattingData = [];

      originalData.forEach((element) => formattingData.add(Diary.fromJson(element)));


      return {
        "success": true,
        "content": formattingData
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.statusCode
      };
    }
  }

  uploadDailyDiary(String title, EmojiType emoji, String message) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/diary",
        data: {
          "title": title,
          "emoji": emoji.ENG,
          "message": message
        }
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.statusCode
      };
    }
  }

  getDetailDiary(String id) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/diary/$id",
      );

      return {
        "success": true,
        "content": Diary.fromJson(response.data)
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.statusCode
      };
    }
  }

  removeDiary(String id) async {
    try {
      Response response = await _dio.delete(
          "$apiUrl/diary/$id",
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.statusCode
      };
    }
  }

  modifyDiary(String id, String title, EmojiType emoji, String message) async {
    try {
      Response response = await _dio.put(
          "$apiUrl/diary/$id",
          data: {
            "title": title,
            "emoji": emoji.ENG,
            "message": message
          }
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.statusCode
      };
    }
  }
}