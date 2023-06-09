import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controllers/profile_controller.dart';
import 'package:flutter_application_1/widgets_common/bg_widget.dart';
import 'package:flutter_application_1/widgets_common/custom_textfield.dart';
import 'package:flutter_application_1/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                        ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : data['imageUrl'] != "" &&
                                controller.profileImgPath.isEmpty
                            ? Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.file(
                                File(controller.profileImgPath.value),
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.heightBox,
                    ourButton(
                        color: redColor,
                        onPress: () {
                          controller.changeImage(context);
                        },
                        textColor: whiteColor,
                        title: "Change"),
                    const Divider(),
                    20.heightBox,
                    customTextField(
                        controller: controller.nameController,
                        hint: nameHint,
                        title: name,
                        isPass: false),
                    10.heightBox,
                    customTextField(
                        controller: controller.oldpassController,
                        hint: passwordHint,
                        title: oldpass,
                        isPass: true),
                    10.heightBox,
                    customTextField(
                        controller: controller.newpassController,
                        hint: passwordHint,
                        title: newpass,
                        isPass: true),
                    20.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : SizedBox(
                            width: context.screenWidth - 40,
                            child: ourButton(
                                color: redColor,
                                onPress: () async {
                                  controller.isloading(true);

                                  if (controller
                                      .profileImgPath.value.isNotEmpty) {
                                    await controller.uploadProfileImage();
                                  } else {
                                    controller.profileImageLink =
                                        data['imageUrl'];
                                  }

                                  if (data['password'] ==
                                      controller.oldpassController.text) {
                                    await controller.changeAuthPassword(
                                        email: data['email'],
                                        password:
                                            controller.oldpassController.text,
                                        newpassword:
                                            controller.newpassController.text);
                                    await controller.updateProfile(
                                        imgUrl: controller.profileImageLink,
                                        name: controller.nameController.text,
                                        password:
                                            controller.newpassController.text);
                                    VxToast.show(context, msg: "Updated");
                                  } else {
                                    VxToast.show(context,
                                        msg: "Wrong Old Password");
                                    controller.isloading(false);
                                  }
                                },
                                textColor: whiteColor,
                                title: "Save")),
                  ],
                ))
            .box
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    );
  }
}
