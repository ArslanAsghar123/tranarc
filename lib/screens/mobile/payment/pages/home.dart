import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tranarc/screens/mobile/payment/Views/MyCardsPage.dart';
import 'package:tranarc/screens/mobile/payment/pages/existing-cards.dart';
import 'package:tranarc/screens/mobile/payment/services/payment-service.dart';
import 'package:tranarc/screens/mobile/products/screens/home_page.dart';

class CardPage extends StatefulWidget {
  @override
  CardPageState createState() => CardPageState();
}

class CardPageState extends State<CardPage> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Get.to(ExistingCardsPage());
        break;
      case 2:
        Get.to(MyCardsPage());
        break;
      case 3:
        Navigator.pop(context);
        break;

    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        foregroundColor: Colors.black,

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            Icon icon;
            Text text;

            switch (index) {
              case 0:
                icon = Icon(Icons.add_circle, color: theme.primaryColor);
                text = Text('Pay via new card');
                break;
              case 1:
                icon = Icon(Icons.credit_card, color: theme.primaryColor);
                text = Text('Pay via existing card');
                break;
              case 2:
                icon = Icon(Icons.edit, color: theme.primaryColor);
                text = Text('Enter existing card Detailes');
                break;

              case 3:
                icon = Icon(Icons.exit_to_app, color: theme.primaryColor);
                text = Text('Back to home');
                break;
            }

            return InkWell(
              onTap: () {
                onItemPress(context, index);
              },
              child: ListTile(
                title: text,
                leading: icon,
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: theme.primaryColor,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
