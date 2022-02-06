import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tranarc/screens/mobile/worker/screens/home_page.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Items item1 = new Items(
    title: "Contractor",
    id: 'C1',
    img: 'assets/mobile/images/house.svg',
  );

  Items item2 = new Items(
    title: "Mistri",
    id: "C2",
    img: 'assets/mobile/images/brickwall.svg',
  );
  Items item3 = new Items(
    title: "Electrician",
    id: "C3",
    img: 'assets/mobile/images/electrician.svg',
  );
  Items item4 = new Items(
    title: "Plumber",
    id: "C4",
    img: 'assets/mobile/images/plumber.svg',
  );
  Items item5 = new Items(
    title: "Worker",
    id: "C5",
    img: 'assets/mobile/images/repair-tools.svg',
  );
  Items item6 = new Items(
    title: "Painter",
    id: "C6",
    img: 'assets/mobile/images/roller.svg',
  );
  Items item7 = new Items(
    title: "Gas Worker",
    id: "C7",
    img: 'assets/mobile/images/welding.svg',
  );
  Items item8 = new Items(
    title: "Carpenter",
    id: "C8",
    img: 'assets/mobile/images/woodworking.svg',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> _listItem = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
    ];
    SizeConfig().init(context);

    return Container(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Get Your Service",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(WorkerPage());
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                              child: GestureDetector(

                            child: Text(
                              "Hire Now",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Categories',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
              Expanded(
                  child: ListView(
                children: _listItem
                    .map((item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: AppColors.gradientIntroEnd,
                              border: Border.all(
                                  color: AppColors.carouselActiveSliderColor,),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Raleway'),
                                  ),

                                  SvgPicture.asset(
                                    item.img.toString(),
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Items {
  String title;
  String id;
  String img;
  String onPressed;

  Items({this.title, this.id, this.img, this.onPressed});
}
