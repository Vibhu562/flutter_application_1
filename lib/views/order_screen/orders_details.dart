import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/views/order_screen/components/order_status.dart';
import 'package:flutter_application_1/views/order_screen/components/order_place_details.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;

  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: "Order Details".text.fontFamily(semibold).make(),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  orderStatus(
                      icon: Icons.done,
                      color: redColor,
                      title: "Placed",
                      showDone: data['order_placed']),
                  orderStatus(
                      icon: Icons.thumb_up,
                      color: Colors.blue,
                      title: "Confirmed",
                      showDone: data['order_confirmed']),
                  orderStatus(
                      icon: Icons.car_crash,
                      color: Colors.yellow,
                      title: "On Delivery",
                      showDone: data['order_on_delivery']),
                  orderStatus(
                      icon: Icons.done_all_rounded,
                      color: Colors.purple,
                      title: "Delivered",
                      showDone: data['order_delivered']),
                  const Divider(),
                  10.heightBox,
                  Column(
                    children: [
                      orderPlaceDetails(
                        title1: "Order Code",
                        title2: "Shipping Method",
                        d1: data['order_code'],
                        d2: data['shipping_method'],
                      ),
                      orderPlaceDetails(
                        title1: "Order Date",
                        title2: "Payment Method",
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format((data['order_date'].toDate())),
                        d2: data['payment_method'],
                      ),
                      orderPlaceDetails(
                        title1: "Payment status",
                        title2: "Delivery Status",
                        d1: "Unpaid",
                        d2: "Order Placed",
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Shipping Address"
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  "${data['order_by_name']}".text.make(),
                                  "${data['order_by_email']}".text.make(),
                                  "${data['order_by_address']}".text.make(),
                                  "${data['order_by_city']}".text.make(),
                                  "${data['order_by_state']}".text.make(),
                                  "${data['order_by_phone']}".text.make(),
                                  "${data['order_by_postalcode']}".text.make(),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Total Amount"
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  "${data['total_amount']}"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ).box.outerShadowMd.white.make(),
                  const Divider(),
                  10.heightBox,
                  "Ordered Product"
                      .text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .makeCentered(),
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data['orders'].length, (index) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderPlaceDetails(
                              title1: data['orders'][index]['title'],
                              title2: data['orders'][index]['tprice'],
                              d1: "${data['orders'][index]['qty']}x",
                              d2: "Refundable",
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  width: 30,
                                  height: 10,
                                  color: Color(data['orders'][index]['color']),
                                )),
                            const Divider(),
                          ]);
                    }).toList(),
                  )
                      .box
                      .outerShadowMd
                      .white
                      .margin(const EdgeInsets.only(bottom: 4))
                      .make(),
                  20.heightBox,
                ],
              ),
            )));
  }
}
