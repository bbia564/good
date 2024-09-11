import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:good_say/db_say/db_say.dart';

class SayAddLogic extends GetxController {

  DBSay dbSay = Get.find<DBSay>();
  int type = Get.arguments;
  String words =  '';
  var titleWord = ''.obs;

  void add (BuildContext context) async {
    if (words.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter something');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    await dbSay.dbBase.insert('say', {
      'created_time': DateTime.now().toIso8601String(),
      'type': type,
      'words': words,
    });
    Fluttertoast.showToast(msg: 'Add Success');
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    switch (type) {
      case 0:
        titleWord.value = ' good morning quote';
        break;
      case 1:
        titleWord.value = ' good night quotes';
        break;
      case 2:
        titleWord.value = ' dream quote';
    }
    super.onInit();
  }


}
