import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';

import '../../../db_mileage/mileage_entity.dart';

class TrafficAddLogic extends GetxController {

  DBMileage dbMileage = Get.find<DBMileage>();

  var list = <TrafficEntity>[].obs;

  Uint8List? image;
  String title = '';

  void getData() async {
    list.value = await dbMileage.getTrafficAllData();
    update();
  }

  void imageSelected(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }
  
  void deleteTraffic(TrafficEntity entity) async {
    await dbMileage.deleteTraffic(entity);
    getData();
  }
  
  void addTraffic(BuildContext context) async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the name of the vehicle');
      return;
    }
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select a picture');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final currentEntity = TrafficEntity(
      id: 0,
      createTime: DateTime.now(),
      name: title,
      image: image!,
    );
    await dbMileage.insertTraffic(currentEntity);
    title = '';
    image = null;
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
