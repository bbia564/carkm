import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mileage_records/main.dart';
import 'package:mileage_records/router/mileage_names.dart';
import 'package:styled_widget/styled_widget.dart';

import 'mileage_first_logic.dart';

class MileageFirstPage extends GetView<MileageFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Milepost')),
      body: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          child: <Widget>[
            Expanded(
                child: <Widget>[
                  Text(
                    'My mileage',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.71), fontSize: 14),
                  ),
                  Obx(() {
                    return Text(
                      '${controller.totalMileage.value} KM',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: <Widget>[
                  Text(
                    'Number of trips',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.71), fontSize: 14),
                  ),
                  Obx(() {
                    return Text(
                      '${controller.totalNum.value}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center))
          ].toRow(),
        ).decorated(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        <Widget>[
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: const Text(
              '#',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
              color: primaryColor, borderRadius: BorderRadius.circular(6))
              .marginSymmetric(vertical: 10),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'My mileage',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ].toRow(),
        Expanded(child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(
            child: Text('No data'),
          )
              : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.list.value.length,
              itemBuilder: (_, index) {
                final entity = controller.list[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    Container(
                      width: 80,
                      height: 60,
                      alignment: Alignment.center,
                      child: Image.memory(
                        entity.traffic.image,
                        width: 44,
                        height: 44,
                        fit: BoxFit.fill,
                      ),
                    ).decorated(
                        color: const Color(0xffe2e9f7),
                        borderRadius: BorderRadius.circular(8)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                          <Widget>[
                            Text(
                              '${entity.startLocation}-${entity
                                  .endLocation}',
                              style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                entity.traffic.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ).decorated(
                                color: const Color(0xffe2e9f7),
                                borderRadius: BorderRadius.circular(6))
                          ].toWrap(),
                          <Widget>[
                            const Text(
                              'Mileage',
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${entity.mileage} KM',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ].toRow()
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 20,
                    )
                  ].toRow(),
                )
                    .decorated(
                    color: const Color(0xfff4f6fa),
                    borderRadius: BorderRadius.circular(10)).marginOnly(bottom: 10)
                    .gestures(onTap: () {
                      Get.toNamed(MileageNames.mileageDetailsPage,arguments: entity)?.then((_) {
                        controller.getData();
                      });
                });
              });
        }))
      ].toColumn().marginAll(15),
    );
  }
}
