import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/widgets_common/exit_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/views/home_screen/home_screen.dart';
import 'package:flutter_application_1/views/category_screen/category_screen.dart';
import 'package:flutter_application_1/views/cart_screen/cart_screen.dart';
import 'package:flutter_application_1/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      ProfileScreen(),
    ];
    return WillPopScope(
        onWillPop: () async {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => exitDialog(context));
          return false;
        },
        child: Scaffold(
            body: Column(children: [
              Obx(() => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value)))
            ]),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                currentIndex: controller.currentNavIndex.value,
                selectedItemColor: redColor,
                selectedLabelStyle: const TextStyle(fontFamily: semibold),
                type: BottomNavigationBarType.fixed,
                backgroundColor: whiteColor,
                items: navbarItem,
                onTap: (value) {
                  controller.currentNavIndex.value = value;
                },
              ),
            )));
  }
}
