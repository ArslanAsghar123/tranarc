import 'package:flutter/material.dart';

class AppColors {
  // region authentication colors

  static var gradientStart = Color(0xff0D3552);
  static var gradientEnd = Color(0xff3E83B3);
  static var gradientIntroStart = Color(0xffC9EFFE);
  static var gradientIntroEnd = Color(0xff6BCEF7);
  static var authenticationBtnColors = Color(0xff6BCEF7);
  static var authenticationEndBtnColor = Color(0xff8CAAC5);
  static var authenticationSubtitleColor = Color(0xffC6D4DD);
  static var authenticationTitleColor = Color(0xffFFFFFF);
  static var textfieldIconColor = Color(0xff3C3C43);
  static var carouselActiveSliderColor = Color(0xff3F85B6);
  static var carouselInActiveSliderColor = Color(0xffF2F2F2);

  // endregion

  //region people section bottomNavigationBar

  static var backgroudColor = Color(0xffFBFCFF);
  static var searchBarColor = Color(0xffF2F5FA);
  static var inactiveTabbarColor = Color(0xffF2F5FA);
  static var inactiveTabbarTextColor = Color(0xff838383);
  static var activeTabbarColor = Color(0xff0A314D);
  static var listBackgroudColor = Color(0xffFEFEFF);
  static var listCurrencyColor = Color(0xff334857);
  static var appbarTitleColor = Color(0xff334857);
  static var titleColor = Color(0xff050505);
  static var subtitleColor = Color(0xff838383);
  static var iconColor = Color(0xff030C29);
  static var greenCircle = Color(0xff35AA74);
  static var activeIndex = Color(0xff0A314D);
  static var inactiveIndex = Color(0xffF2F5FA);
  static var verticalMenuButton = Color(0xff828282);

  //endregion

  //region bottomNavigation Bar

  static var bottomnavigationBarColor = Color(0xff0A314D);
  static var bottomnavigationBarActiveColor = Color(0xff3F85B6);

  //endregion

  //region add customer and employees

  static var addcustomerBtnColor = Color(0xff0A314D);
  static var photoBackgroudColor = Color(0xff86D7F9);
  static var photoIconBackgroudColor = Color(0xff62AED7);
  static var addcustomerTextfield = Color(0xff283373);
  static var addcustomerTextfieldBorder = Color(0xffC3C6D7);
  static var addcustomerTextfieldlableColor = Color(0xff7D84AB);
  static var addcustomerCancelBtnColor = Color(0xff7D84AB);

  //endregion

  //region edit profile
  static var circleBackgroudColor = Color(0xff3F85B6);
  static var editprofileHintTextColor = Color(0xff333333);
  static var editprofileLableTextColor = Color(0xff828282);
  static var editprofileBorderColor = Color(0xff222232);
  static var editprofileBtnColor = Color(0xff0A314D);

//endregion

  //region filters
  static var filterByRecent = Color(0xff3F85B6);
  static var filterByDate = Color(0xffFFFFFF);
  static var filterByDateBackgroudColors = Color(0xffF2F2F2);
  static var selectedText = Color(0xff3F85B6);
  static var unselectedText = Color(0xff838383);
  static var scrollColor = Color(0xff6BCEF7);
  static var btnBackgroudColor = Color(0xff0A314D);

  //endregion

  //region gradients
  static const kPrimaryGradientColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff0D3552), Color(0xff337EB3)]);

  static const kSecondaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffC9EFFE), Color(0xff6BCEF7)],
  );

  //endregion

  //region textStyles
  static const kTitleTextStyle = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xffC5D4DD));
  static const kSubTitleTextStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w800,
    fontSize: 34,
    color: Color(0xffFFFFFF),
  );
  static const kTextfieldTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Color(0xff3C3C43),
  );

  static const kBtnTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black,
  );

//endregion

}
