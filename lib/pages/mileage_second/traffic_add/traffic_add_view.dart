import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mileage_records/main.dart';
import 'package:mileage_records/pages/mileage_add/mileage_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'traffic_add_logic.dart';

class TrafficAddPage extends GetView<TrafficAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fa),
      appBar: AppBar(
        title: const Text('Traffic Add'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<TrafficAddLogic>(
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: <Widget>[
                          SizedBox(
                            height: 40,
                            child: <Widget>[
                              const Text(
                                'Name of vehicle',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: MileageTextField(
                                      maxLength: 5,
                                      value: controller.title,
                                      textAlign: TextAlign.end,
                                      onChange: (value) {
                                        controller.title = value;
                                      }))
                            ].toRow(),
                          ),
                          Divider(
                            height: 25,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          Container(
                            color: Colors.transparent,
                            height: 44,
                            child: <Widget>[
                              const Text(
                                'Add icon',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              controller.image == null
                                  ? const Text(
                                      'Please select',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(22),
                                      child: Image.memory(
                                        controller.image!,
                                        width: 44,
                                        height: 44,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                            ].toRow(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                          ).gestures(onTap: () {
                            controller.imageSelected(context);
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                              .decorated(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10))
                              .gestures(onTap: () {
                            controller.addTraffic(context);
                          })
                        ].toColumn(),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 120),
                        padding: const EdgeInsets.all(15),
                        child: controller.list.isEmpty
                            ? const Center(
                                child: Text('No data'),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: controller.list.length,
                                itemBuilder: (_, index) {
                                  final entity = controller.list[index];
                                  return <Widget>[
                                    SizedBox(
                                      height: 40,
                                      child: <Widget>[
                                        Expanded(
                                            child: Text(
                                          entity.name,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.delete_forever,
                                          size: 30,
                                          color: Colors.black,
                                        ).gestures(onTap: () {
                                          controller.deleteTraffic(entity);
                                        })
                                      ].toRow(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween),
                                    ),
                                    Divider(
                                      height: 15,
                                      color: Colors.grey.withOpacity(0.3),
                                    )
                                  ].toColumn();
                                }),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))
                    ].toColumn(),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
