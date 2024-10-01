import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';

import '../../db_mileage/mileage_entity.dart';

class MileageDetailsLogic extends GetxController {

  DBMileage dbMileage = Get.find<DBMileage>();

  MileageEntity entity = Get.arguments;

  void deleteMileage() async {
    await dbMileage.deleteMileage(entity);
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

}
