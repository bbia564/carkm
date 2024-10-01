import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mileage_records/router/mileage_names.dart';
import 'package:styled_widget/styled_widget.dart';

import 'mileage_second_logic.dart';

class MileageSecondPage extends GetView<MileageSecondLogic> {
  Widget _setItem(int index, BuildContext context) {
    final titles = [
      'Add transportation',
      'Clean all records',
      'About app'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        Visibility(
          visible: index == 0,
            child: const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ))
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed(MileageNames.trafficAddPage);
          break;
        case 1:
          controller.cleanMileageData();
          break;
        case 2:
          controller.aboutMileageApp(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _setItem(0, context),
                _setItem(1, context),
                _setItem(2, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
