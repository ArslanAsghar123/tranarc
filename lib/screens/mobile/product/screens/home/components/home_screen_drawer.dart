
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tranarc/screens/mobile/product/constants.dart';
import 'package:tranarc/screens/mobile/product/screens/change_display_picture/change_display_picture_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/change_email/change_email_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/change_phone/change_phone_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/edit_product/edit_product_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/manage_addresses/manage_addresses_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/my_orders/my_orders_screen.dart';
import 'package:tranarc/screens/mobile/product/screens/my_products/my_products_screen.dart';
import 'package:tranarc/screens/mobile/product/services/authentification/authentification_service.dart';
import 'package:tranarc/screens/mobile/product/services/database/user_database_helper.dart';
import 'package:tranarc/screens/mobile/product/utils.dart';
import 'package:tranarc/screens/mobile/products/screens/landing_page.dart';

import '../../change_display_name/change_display_name_screen.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
print('${user}');
    String useremail;
    useremail = user.email;
    print(useremail);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            StreamBuilder<User>(
                stream: AuthentificationService().userChanges,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data;
                    return buildUserAccountsHeader(user);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: Icon(Icons.error),
                    );
                  }
                }),
            buildEditAccountExpansionTile(context),
            ListTile(
              leading: Icon(Icons.edit_location),
              title: Text(
                "Manage Addresses",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              onTap: () async {
                bool allowed = AuthentificationService().currentUserVerified;
                if (!allowed) {
                  final reverify = await showConfirmationDialog(context,
                      "You haven't verified your email address. This action is only allowed for verified users.",
                      positiveResponse: "Resend verification email",
                      negativeResponse: "Go back");
                  if (reverify) {
                    final future = AuthentificationService()
                        .sendVerificationEmailToCurrentUser();
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return FutureProgressDialog(
                          future,
                          message: Text("Resending verification email"),
                        );
                      },
                    );
                  }
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageAddressesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.edit_location),
              title: Text(
                "My Orders",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              onTap: () async {
                bool allowed = AuthentificationService().currentUserVerified;
                if (!allowed) {
                  final reverify = await showConfirmationDialog(context,
                      "You haven't verified your email address. This action is only allowed for verified users.",
                      positiveResponse: "Resend verification email",
                      negativeResponse: "Go back");
                  if (reverify) {
                    final future = AuthentificationService()
                        .sendVerificationEmailToCurrentUser();
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return FutureProgressDialog(
                          future,
                          message: Text("Resending verification email"),
                        );
                      },
                    );
                  }
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOrdersScreen(),
                  ),
                );
              },
            ),

            useremail == 'arslanasghar136@gmail.com' || useremail == 'ammar.rafiq82@gmail.com'
                ? buildSellerExpansionTile(context)
                : Text(''),
            // ListTile(
            //   leading: Icon(Icons.info),
            //   title: Text(
            //     "About Developer",
            //     style: TextStyle(fontSize: 16, color: Colors.black),
            //   ),
            //   onTap: () async {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => AboutDeveloperScreen(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Sign out",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              onTap: () async {
                final confirmation =
                    await showConfirmationDialog(context, "Confirm Sign out ?");
                if (confirmation) AuthentificationService().signOut();
                Get.offAll(LandingPage());

              },
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsHeader(User user) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.15),
      ),
      accountEmail: Text(
        user.email ?? "No Email",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      accountName: Text(
        user.displayName ?? "No Name",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      currentAccountPicture: FutureBuilder(
        future: UserDatabaseHelper().displayPictureForCurrentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            Logger().w(error.toString());
          }
          return CircleAvatar(
            backgroundColor: kTextColor,
          );
        },
      ),
    );
  }

  ExpansionTile buildEditAccountExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.person),
      title: Text(
        "Edit Account",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      children: [
        ListTile(
          title: Text(
            "Change Display Picture",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeDisplayPictureScreen(),
                ));
          },
        ),
        ListTile(
          title: Text(
            "Change Display Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeDisplayNameScreen(),
                ));
          },
        ),
        ListTile(
          title: Text(
            "Change Phone Number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePhoneScreen(),
                ));
          },
        ),
        ListTile(
          title: Text(
            "Change Email",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeEmailScreen(),
                ));
          },
        ),
        ListTile(
          title: Text(
            "Change Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ChangePasswordScreen(),
            //     ));
          },
        ),
      ],
    );
  }

  Widget buildSellerExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.business),
      title: Text(
        "I am Seller",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      children: [
        ListTile(
          title: Text(
            "Add New Product",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {
            bool allowed = AuthentificationService().currentUserVerified;
            if (!allowed) {
              final reverify = await showConfirmationDialog(context,
                  "You haven't verified your email address. This action is only allowed for verified users.",
                  positiveResponse: "Resend verification email",
                  negativeResponse: "Go back");
              if (reverify) {
                final future = AuthentificationService()
                    .sendVerificationEmailToCurrentUser();
                await showDialog(
                  context: context,
                  builder: (context) {
                    return FutureProgressDialog(
                      future,
                      message: Text("Resending verification email"),
                    );
                  },
                );
              }
              return;
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProductScreen()));
          },
        ),
        ListTile(
          title: Text(
            "Manage My Products",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {
            bool allowed = AuthentificationService().currentUserVerified;
            if (!allowed) {
              final reverify = await showConfirmationDialog(context,
                  "You haven't verified your email address. This action is only allowed for verified users.",
                  positiveResponse: "Resend verification email",
                  negativeResponse: "Go back");
              if (reverify) {
                final future = AuthentificationService()
                    .sendVerificationEmailToCurrentUser();
                await showDialog(
                  context: context,
                  builder: (context) {
                    return FutureProgressDialog(
                      future,
                      message: Text("Resending verification email"),
                    );
                  },
                );
              }
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyProductsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
