import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> onPressNewQuizButton() async {
    try {
      Get.toNamed('/answer_quiz');
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }
}
