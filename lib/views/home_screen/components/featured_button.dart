import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/lists.dart';
import 'package:flutter_application_1/views/category_screen/category_details.dart';
import 'package:flutter_application_1/widgets_common/home_button.dart';
import 'package:get/get.dart';

Widget featuredButton({String? title, icon}) {
  return Row(children: [
    Image.asset(
      icon,
      width: 60,
      fit: BoxFit.fill,
    ),
    10.widthBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make(),
  ])
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make()
      .onTap(() {
    Get.to(() => CategoryDetails(title: title));
  });
}
