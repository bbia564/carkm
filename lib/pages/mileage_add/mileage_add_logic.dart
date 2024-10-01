import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';
import 'package:mileage_records/db_mileage/mileage_entity.dart';

class MileageAddLogic extends GetxController {

  DBMileage dbMileage = Get.find<DBMileage>();

  String startLocation = '';
  String endLocation = '';
  String mileage = '';
  late TrafficEntity traffic;
  int type = 0;
  String content = '';

  var list = <TrafficEntity>[];

  void getTraffic() async {
    list = await dbMileage.getTrafficAllData();
    traffic = list.first;
    update();
  }

  void commit(BuildContext context) async {
    if (startLocation.isEmpty || endLocation.isEmpty || mileage.isEmpty || content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the complete information');
      return;
    }
    int mileageNum = int.tryParse(mileage) ?? 0;
    mileage = mileageNum.toString();
    update();
    if (mileageNum <= 0) {
      Fluttertoast.showToast(msg: 'Please fill in the correct mileage');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final entity = MileageEntity(
      id: 0,
      createTime: DateTime.now(),
      startLocation: startLocation,
      endLocation: endLocation,
      mileage: mileageNum,
      traffic: traffic,
      content: content,
    );
    await dbMileage.insertMileage(entity);
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getTraffic();
    super.onInit();
  }

}
