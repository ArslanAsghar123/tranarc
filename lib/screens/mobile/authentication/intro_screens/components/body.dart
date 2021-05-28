import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/screens/mobile/authentication/intro_screens/components/intro_screens_data.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to",
      "subtext": "Transarc!",
      "image": "assets/mobile/images/intro_screen1.svg",
  "bottomTxt": "Step 1",
  "bottomSubTxt": "Link your bank accounts to tranarc",
    },
    {
      "text": "Welcome to",
      "subtext": "Transarc!",
      "image": "assets/mobile/images/intro_screen2.svg",
      "bottomTxt": "Step 2",
      "bottomSubTxt": "Add your customers and employees",
    },
    {
      "text": "Welcome to",
      "subtext": "Transarc!",
      "image": "assets/mobile/images/intro_screen3.svg",
      "bottomTxt": "Step 3",
      "bottomSubTxt": "Track all payments, expenses and even \n payroll status",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => IntroContent(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                      subtext: splashData[index]['subtext'],
                      bottomSubTxt: splashData[index]['bottomSubTxt'],
                      bottomTxt: splashData[index]['bottomTxt'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        Spacer(flex: 3),

                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned.fill(
              child: SvgPicture.asset(
                "assets/mobile/images/vector.svg",
                alignment: Alignment.bottomLeft,
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                "assets/mobile/images/vector-1.svg",
                alignment: Alignment.bottomLeft,
              ),
            ),
            currentPage == 2
                ? Positioned.fill(
                    top: SizeConfig.screenHeight * 0.83,
                    left: SizeConfig.screenWidth * 0.7,
                    bottom: SizeConfig.screenHeight * 0.04,
                    right: SizeConfig.screenWidth * 0.099,
                    child: button(context,
                        lable: "OK",
                        colour: AppColors.authenticationEndBtnColor,
                        colourText: Colors.white,
                        press: () =>
                            RouteApp.instance.pushPage(context, LogInScreen())),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: AppColors.kAnimationDuration,
      margin: EdgeInsets.only(right: 10),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.carouselActiveSliderColor
            : AppColors.carouselInActiveSliderColor,
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
