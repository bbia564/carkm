import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';

import '../../db_mileage/mileage_entity.dart';

class MileageFirstLogic extends GetxController {

  DBMileage dbMileage = Get.find<DBMileage>();

  var totalMileage = 0.obs;
  var totalNum = 0.obs;

  var list = <MileageEntity>[].obs;

  void getData() async {
    list.value = await dbMileage.getMileageAllData();
    totalMileage.value = list.value.fold(0, (previousValue, element) => previousValue + element.mileage);
    totalNum.value = list.value.length;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
