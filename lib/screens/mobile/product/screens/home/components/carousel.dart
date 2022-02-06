import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/* list of images that we want on your carousel. Images can be AssestImage
or NetworkImage */
final List<String> imgList = [
  'assets/images/splash_1.png',
  'assets/images/splash_2.png',
  'assets/images/splash_3.png',
];

/* list of text that we will be displayed over the images on carousel */
final List<String> textList = [
  'A place where you can buy each & every household things',
  'We give 100% genuine product and you can trust us',
  'For more Queries e-mail us at arslanasghar136@gmail.com',
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation; /* Will get the orientation of the phone and
    accordingly we can change the height and width */
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(

          viewportFraction: 1.0,
          items: map<Widget>(
            imgList,
                (index, i) {
              return Container(
                width: screenWidth - 60,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        i,
                        fit: BoxFit.fill,
                        /*Giving width and height to the image so that it will cover*/
                        width: screenWidth - 84,
                        height: orientation == Orientation.portrait ? screenHeight / 2 : screenWidth / 2,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: CarouselText(
                            text: textList[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
          autoPlay: true,
          autoPlayInterval: Duration(
            seconds: 5,
          ),
          autoPlayAnimationDuration: Duration(
            seconds: 1,
          ),
          height: orientation == Orientation.portrait ? screenHeight / 2 : screenWidth / 2,
          pauseAutoPlayOnTouch: Duration(
            seconds: 5,
          ),
          onPageChanged: (index) {
            setState(() {
               _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            imgList,
                (index, url) {
              return Container(
                width: _current==index? 32.0 : 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:
                  _current == index ? Color(0xFF1BBC9B) : Color(0xFF707070), /* Color of active indicator(active:inactive) */
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselWithIndicator();
  }
}

class CarouselText extends StatelessWidget {
  CarouselText({
    this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}