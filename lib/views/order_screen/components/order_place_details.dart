import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              "$title1".text.make(),
              "$d1".text.color(redColor).fontFamily(semibold).make(),
            ],
          ),
          SizedBox(
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "$title2".text.fontFamily(semibold).make(),
                  "$d2".text.make(),
                ],
              )),
        ],
      ));
}
