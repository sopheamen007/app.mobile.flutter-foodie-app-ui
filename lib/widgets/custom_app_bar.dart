import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/fontsizes.dart';
import 'package:foodie_ui_kit/theme/helper.dart';
import 'package:foodie_ui_kit/theme/padding.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.8,
      brightness: Brightness.light,
      backgroundColor: textWhite,
      automaticallyImplyLeading: false,
      primary: false,
      excludeHeaderSemantics: true,
      flexibleSpace: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: getSvgIcon("arrow_back_icon.svg"),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
