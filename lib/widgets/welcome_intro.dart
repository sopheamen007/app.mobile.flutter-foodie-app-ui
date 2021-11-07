import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie_ui_kit/theme/colors.dart';

class WelcomeIntro extends StatefulWidget {
  final List slides;
  WelcomeIntro({
    required this.slides,
    Key? key,
  }) : super(key: key);
  @override
  _WelcomeIntroState createState() => _WelcomeIntroState();
}

class _WelcomeIntroState extends State<WelcomeIntro> {
  double currentPage = 0.0;
  final _pageViewController = new PageController();
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageViewController,
          itemCount: widget.slides.length,
          itemBuilder: (BuildContext context, int index) {
            _pageViewController.addListener(() {
              setState(() {
                currentPage = _pageViewController.page!;
              });
            });
            List<Widget> pages =
                widget.slides.map((item) => getLayoutPage(item)).toList();
            return pages[index];
          },
        ),
        Positioned.fill(
          bottom: 80,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      widget.slides.length, (index) => getLayoutDot(index)),
                ),
              )),
        ),
        Positioned.fill(
          top: 100,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Skip",
                        style: TextStyle(
                            fontSize: 16,
                            color: textBlack.withOpacity(0.5),
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
            child: InkWell(
              onTap: () {
                if (currentPage < 2) {
                  currentPage++;
                  _pageViewController.animateToPage(currentPage.toInt(),
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                }
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    (currentPage < 2) ? "Next" : "Get Start",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getLayoutPage(item) {
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              item['image'],
              width: MediaQuery.of(context).size.width - 80,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: <Widget>[
                  Text(item['header'],
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: primary,
                          height: 2.0)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    item['description'],
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                        fontSize: 14.0,
                        height: 1.8),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLayoutDot(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 13.0,
      width: 13.0,
      decoration: BoxDecoration(
          color: currentPage.round() == index
              ? primary
              : Color(0XFF256075).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
