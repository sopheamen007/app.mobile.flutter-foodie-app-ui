import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/fontsizes.dart';
import 'package:foodie_ui_kit/theme/helper.dart';

class DishCard extends StatelessWidget {
  final dish;
  final double width;

  const DishCard({
    Key? key,
    required this.dish,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: this.width,
              height: getHeight(this.width, "4:3"),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  getImageNetwork(dish["image"]),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish["name"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: textBlack,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "By " + dish["store"],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: grey,
                    fontSize: subTitleFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getSvgIcon("clock_icon.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Est: " + dish["delivery_time"],
                      style: TextStyle(
                          color: primary,
                          fontSize: hintTextFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
