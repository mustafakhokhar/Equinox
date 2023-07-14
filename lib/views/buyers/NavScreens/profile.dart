import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/views/buyers/ProfilePages/ContactUs.dart';
import 'package:temp_store/views/buyers/ProfilePages/EditProfile.dart';
import 'package:temp_store/views/buyers/ProfilePages/Favorites.dart';
import 'package:temp_store/views/buyers/ProfilePages/MyCart.dart';
import 'package:temp_store/views/buyers/ProfilePages/OrdersHistory.dart';
import 'package:temp_store/views/buyers/ProfilePages/Settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.mobile_friendly))
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              /// -- IMAGE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.amber,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(image: AssetImage(icKitPhone))),
                      ),
                      // Upload Button
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: primary),
                          child: const Icon(
                            Icons.file_upload_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mustafa Khokhar',
                          style: Theme.of(context).textTheme.headlineSmall),
                      const Text('@mustafa_khokhar',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    const UpdateProfileScreen(),
                              ),
                            );
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
                  ))
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),

              /// -- MENU
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
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {
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
              ProfileMenuWidget(
                  title: "Contact Us", icon: Icons.info_outline, onPress: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ContactUsPage(),
                      ),
                    );
                  }),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.power_settings_new_outlined,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          // AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
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
