import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mileage_records/main.dart';
import 'package:mileage_records/pages/mileage_add/mileage_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'mileage_add_logic.dart';

class MileageAddPage extends GetView<MileageAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff4f6fa),
        appBar: AppBar(
          title: const Text("Add mileage"),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: GetBuilder<MileageAddLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    child: <Widget>[
                      SizedBox(
                        height: 40,
                        child: <Widget>[
                          const Text(
                            'Starting point',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: MileageTextField(
                                  maxLength: 15,
                                  textAlign: TextAlign.end,
                                  value: controller.startLocation,
                                  onChange: (value) {
                                    controller.startLocation = value;
                                  }))
                        ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: <Widget>[
                          const Text(
                            'End point',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: MileageTextField(
                                  maxLength: 15,
                                  textAlign: TextAlign.end,
                                  value: controller.endLocation,
                                  onChange: (value) {
                                    controller.endLocation = value;
                                  }))
                        ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      )
                    ].toColumn(
                        separator: Divider(
                      height: 15,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      SizedBox(
                        height: 40,
                        child: <Widget>[
                          const Text(
                            'Mileage (KM) ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: MileageTextField(
                                  maxLength: 4,
                                  isInteger: true,
                                  textAlign: TextAlign.end,
                                  value: controller.mileage,
                                  onChange: (value) {
                                    controller.mileage = value;
                                  }))
                        ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1 / 2),
                            itemCount: controller.list.length,
                            itemBuilder: (_, index) {
                              final entity = controller.list[index];
                              return Container(
                                padding: const EdgeInsets.all(5),
                                child: <Widget>[
                                  Image.memory(
                                    entity.image,
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.cover
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      entity.name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: index == controller.type
                                              ? Colors.white
                                              : Colors.black54),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ].toRow(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center),
                              )
                                  .decorated(
                                      color: index == controller.type
                                          ? primaryColor
                                          : const Color(0xfff4f4f4),
                                      borderRadius: BorderRadius.circular(12))
                                  .gestures(onTap: () {
                                controller.type = index;
                                controller.traffic = entity;
                                controller.update();
                              });
                            }),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      const Text(
                        'Mileage diary',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MileageTextField(
                          padding: EdgeInsets.zero,
                            maxLines: 10,
                            maxLength: 500,
                            value: controller.content,
                            onChange: (value) {
                              controller.content = value;
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child:const Text(
                          'Commit mileage',
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ).decorated(color: primaryColor,borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                        controller.commit(context);
                      })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ].toColumn(),
              );
            }).marginAll(15))));
  }
}
