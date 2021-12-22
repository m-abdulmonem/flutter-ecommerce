import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:ecommerce/futures/home/presentation/pages/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  final list = [
    {"image": "assets/image/logo.png", "title": "mens"},
    {"image": "assets/image/logo.png", "title": "mens11"},
    {"image": "assets/image/logo.png", "title": "mens2"},
    {"image": "assets/image/logo.png", "title": "mens3"},
    {"image": "assets/image/logo.png", "title": "mens4"},
    {"image": "assets/image/logo.png", "title": "mens5"},
    {"image": "assets/image/logo.png", "title": "mens6"},
    {"image": "assets/image/logo.png", "title": "mens7"}
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeSearch(),
        VerticalSpace(Get.height * .05),
        CustomText(
          "Categories",
          fontSize: 19,
          padding: EdgeInsets.only(left: 14),
        ),
        VerticalSpace(Get.height * .03),
        SizedBox(
          height: 80,
          child: ListView.builder(
              // padding: EdgeInsets.symmetric(horizontal: 14),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0d242424),
                              offset: Offset(0, 5),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          list[index]["image"]!,
                          width: 25,
                          height: 25,
                        ),
                        width: 50,
                        height: 50,
                      ),
                      VerticalSpace(10),
                      CustomText(list[index]["title"]!)
                    ],
                  ),
                );
              }),
        ),
        VerticalSpace(Get.height * .05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              CustomText("Best Selling"),
              Spacer(),
              CustomText(
                "See All",
                onTap: () => "",
              )
            ],
          ),
        ),
        VerticalSpace(Get.height * .03),
        SizedBox(
          height: Get.height - Get.height * 0.3,
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, int index) {
                return Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/image/logo.png",
                        width: 100,
                        height: 100,
                      ),
                      CustomText(
                        "BeoPlay Speaker $index",
                        color: Colors.black,
                      ),
                      CustomText(
                        "Bang and Olufsen",
                        color: Color(0xff929292),
                      ),
                      CustomText(
                        "\$755",
                        color: ColorPrimary,
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
