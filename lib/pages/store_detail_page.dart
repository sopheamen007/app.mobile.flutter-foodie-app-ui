import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie_ui_kit/data/product_json.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/padding.dart';

class StoreDetailPage extends StatefulWidget {
  final String image;
  final String name;
  const StoreDetailPage({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(200)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: textWhite)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Text(
                        "Delivery 10 Min",
                        style: TextStyle(
                            fontSize: 16,
                            color: textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: textWhite, size: 18),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(2591)",
                        style: TextStyle(fontSize: 15, color: textWhite),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Menu",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Most ordered right now",
                  style: TextStyle(
                      fontSize: 15, color: textBlack.withOpacity(0.8)),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: List.generate(productItems.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width * 0.75) - 40,
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productItems[index]['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      productItems[index]['price'],
                                      style: TextStyle(
                                          color: textBlack, fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      productItems[index]['discount'],
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: textBlack,
                                          fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        productItems[index]['image']),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: primary),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textWhite)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textWhite),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "View your cart",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhite),
                  ),
                  Text(
                    "\$ 3.98",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textWhite),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
