import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tranarc/screens/mobile/product/screens/home/home_screen.dart';
import 'package:tranarc/screens/mobile/products/product.dart';
import 'package:tranarc/screens/mobile/products/screens/home_page.dart';
import 'package:tranarc/screens/mobile/worker/screens/home_page.dart';
import 'package:tranarc/screens/mobile/worker/worker.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Choose Your Category',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: AppColors.carouselActiveSliderColor,
                    onTap: () {
                      Get.to(WorkerScreen());
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.carouselActiveSliderColor),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 10),
                            child: SvgPicture.asset(
                              'assets/mobile/icons/worker.svg',
                              width: 90,
                              height: 90,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Workers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Raleway'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: AppColors.carouselActiveSliderColor,
                    onTap: () {
                      Get.to(HomeScreen());
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.carouselActiveSliderColor),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 10),
                            child: SvgPicture.asset(
                              'assets/mobile/icons/construction.svg',
                              width: 90,
                              height: 90,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Products',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.w700,
                                  fontFamily: 'Raleway'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
