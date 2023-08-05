import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/views/buyers/ProfilePages/ContactUs.dart';
import 'package:temp_store/views/buyers/ProfilePages/EditProfile.dart';
import 'package:temp_store/views/buyers/ProfilePages/Favorites.dart';
import 'package:temp_store/views/buyers/ProfilePages/MyCart.dart';
import 'package:temp_store/views/buyers/ProfilePages/OrdersHistory.dart';
import 'package:temp_store/views/buyers/ProfilePages/Settings.dart';
import 'package:temp_store/views/onBoardingScreens/SignIn.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              /// -- IMAGE
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        // color: primary,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.network(userController
                                        .user?.image ==
                                    ''
                                ? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
                                : userController.user?.image ??
                                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png')),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User Name
                          Text(
                              userController.user?.name == ''
                                  ? 'User Name'
                                  : userController.user?.name ?? 'User Name',
                              style: Theme.of(context).textTheme.headlineSmall),
                          // User Subtitle
                          Text(
                              userController.user?.phone == ''
                                  ? 'Add Mobile Number'
                                  : userController.user?.phone ??
                                      'Add Mobile Number',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          if (authController.user?.uid == null) ...[
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(SignInScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text('Login',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                          if (authController.user?.uid != null) ...[
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(const EditProfilePage());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text('Edit Profile',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ],
                      ))
                    ],
                  )),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),

              /// Favorites
              ProfileMenuWidget(
                  title: "Favourites",
                  icon: Icons.favorite_border,
                  onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const FavoritesPage(),
                      ),
                    );
                  }),
              // My Cart
              ProfileMenuWidget(
                  title: "My Cart",
                  icon: Icons.shopping_bag_outlined,
                  onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  }),
              // My Orders
              ProfileMenuWidget(
                  title: "My Orders",
                  icon: Icons.shopping_cart_outlined,
                  onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const OrdersHistoryPage(),
                      ),
                    );
                  }),
              // Settings
              ProfileMenuWidget(
                  title: "Settings",
                  icon: Icons.settings,
                  onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  }),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),
              // Contact Us
              ProfileMenuWidget(
                  title: "Contact Us",
                  icon: Icons.info_outline,
                  onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ContactUsPage(),
                      ),
                    );
                  }),
              // Logout
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.power_settings_new_outlined,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    if (authController.user?.uid != null ||
                        userController.user?.email != null) {
                      Get.defaultDialog(
                        title: "LOGOUT",
                        titlePadding: const EdgeInsets.symmetric(vertical: 20),
                        titleStyle: const TextStyle(fontSize: 20),
                        content:
                            const Text("Are you sure, you want to Logout?"),
                        confirm: ElevatedButton(
                          onPressed: () {
                            authController.signOut();
                            Get.back();
                          },
                          // AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                        cancel: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text("No")),
                      );
                    } else {
                      Get.defaultDialog(
                        titlePadding: const EdgeInsets.symmetric(vertical: 20),
                        title: "You Kiddin' Me?",
                        titleStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        content: const Text("Sign-In first! 😏"),
                        cancel: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text("Okay")),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? secondary : primary;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 18.0, color: secondary))
          : null,
    );
  }
}
