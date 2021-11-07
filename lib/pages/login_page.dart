import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/helper.dart';
import 'package:foodie_ui_kit/theme/padding.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Foodies",
                style: TextStyle(
                    color: primary, fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone Number",
                style: TextStyle(
                    fontSize: 16, color: grey, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: textFieldBg, borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    cursorColor: textBlack,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Phone Number"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 16, color: grey, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: textFieldBg, borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          obscureText: true,
                          cursorColor: textBlack,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password"),
                        ),
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/root_app", (route) => false);
            },
            child: Container(
              width: 141,
              height: 45,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        color: textWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  getSvgIcon("arrow_forward_icon.svg")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                "Does not have an account yet?",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              Text(
                " Create One",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
