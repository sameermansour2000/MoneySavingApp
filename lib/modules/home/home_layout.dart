import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/controller/home_controller.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/notification/notification.dart';
import 'package:ms/modules/qr_scanner/qr_generator.dart';
import 'package:ms/modules/rate_screan.dart';
import 'package:ms/modules/search/search.dart';
import 'package:ms/modules/setting/setting.dart';
import 'home_screen.dart';


class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  final List<Widget>screans = [
    HomeScreen(),
    SearchLayout(),
    NotificationScrean(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
          builder: (controller) {
        return Scaffold(

          body: screans[controller.selectedScrean],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: AppColor.VioletVLueOpc_20,
            selectedItemColor: AppColor.violetBlueDark,
            currentIndex:controller.selectedScrean ,
            onTap: (index) {
              controller.changeScrean(index);
              Get.to(()=>RateScrean());
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      }),
    );
  }
}
