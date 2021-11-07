import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/data/category_json.dart';
import 'package:foodie_ui_kit/data/store_json.dart';
import 'package:foodie_ui_kit/pages/store_detail_page.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/fontsizes.dart';
import 'package:foodie_ui_kit/theme/helper.dart';
import 'package:foodie_ui_kit/theme/padding.dart';
import 'package:foodie_ui_kit/widgets/dish_card.dart';
import 'package:foodie_ui_kit/widgets/main_app_bar.dart';
import 'package:foodie_ui_kit/widgets/store_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: Size.fromHeight(80)),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            child: Image.asset(
              getImage("promotion.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: mainPadding, bottom: mainPadding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(storeTypes.length, (index) {
                    return Container(
                      width: 120,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getSvgIcon(storeTypes[index]['image']),
                          SizedBox(
                            height: 5,
                          ),
                          Text(storeTypes[index]['name'])
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(storeItems.length, (index) {
                        var store = storeItems[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StoreDetailPage(
                                              image: store['image'],
                                              name: store['name'],
                                            )));
                              },
                              child: Container(
                                child: StoreCard(width: 280, store: store),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoreDetailPage(
                                            image: store['image'],
                                            name: store['name'],
                                          )));
                            },
                            child: Container(
                              child: StoreCard(width: 280, store: store),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Recommeded Dishes",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          List.generate(recommendedDishes.length, (index) {
                        var dishes = recommendedDishes[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StoreDetailPage(
                                              image: dishes['image'],
                                              name: dishes['name'],
                                            )));
                              },
                              child: Container(
                                child: DishCard(width: 180, dish: dishes),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoreDetailPage(
                                            image: dishes['image'],
                                            name: dishes['name'],
                                          )));
                            },
                            child: Container(
                              child: DishCard(width: 180, dish: dishes),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(storeList.length, (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: bottomMainPadding),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoreDetailPage(
                                          image: storeList[index]['image'],
                                          name: storeList[index]['name'],
                                        )));
                          },
                          child: Container(
                            child: StoreCard(
                                width: size.width - (mainPadding * 2),
                                store: storeList[index]),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
