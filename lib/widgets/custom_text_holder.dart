import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie_ui_kit/theme/colors.dart';

class CustomTextHolder extends StatelessWidget {
  const CustomTextHolder({
    Key? key,
    required this.label,
    required this.value,
    required this.svgImage,
    this.type = '',
    this.svgIcon = false,
  }) : super(key: key);

  final String label;
  final String value;
  final bool svgIcon;
  final String svgImage;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: primary, fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    value,
                    style: TextStyle(color: textBlack, fontSize: 14),
                  ),
                ],
              ),
              (svgIcon)
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: SvgPicture.asset(
                          svgImage,
                          color: primary,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextHolderShort extends StatelessWidget {
  const CustomTextHolderShort({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: primary, fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    value,
                    style: TextStyle(color: textBlack, fontSize: 14),
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
