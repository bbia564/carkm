import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'mileage_details_logic.dart';

class MileageDetailsPage extends GetView<MileageDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fa),
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.white,
        actions: [
          const Text(
            'Delete',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.deleteMileage();
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<MileageDetailsLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  Container(
                    width: 80,
                    height: 60,
                    alignment: Alignment.center,
                    child: Image.memory(
                      controller.entity.traffic.image,
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
                        '${controller.entity.startLocation}-${controller.entity.endLocation}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          controller.entity.traffic.name,
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
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${controller.entity.mileage} KM',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ].toRow()
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                ].toRow(),
              )
                  .decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))
                  .marginOnly(bottom: 10),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  <Widget>[
                    const Text(
                      'Mileage diary',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.entity.createTimeStr,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  Divider(height: 20,color: Colors.grey.withOpacity(0.3),),
                  Text(
                    controller.entity.content,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
