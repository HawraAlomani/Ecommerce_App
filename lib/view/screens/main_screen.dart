import 'package:ecommerce_app/logic/controllers/main_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: <Widget>[
        Get.isDarkMode
            ? Image.asset(
                "assets/images/mainBKLight.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/mainBKDark.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
        Obx(() {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text(
                  controller.title[controller.currentIndex.value],
                  style: const TextStyle(fontSize: 22, shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 3.0,
                      color: mainColor,
                    ),
                  ]),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: Get.isDarkMode
                        ? const LinearGradient(
                            colors: [lightPurpleClr, midPurpleClr],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp)
                        : const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 74, 71, 96),
                              Color.fromARGB(255, 22, 23, 51)
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                  ),
                ),
                leading: Container(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greenClr),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/images/icons/shopping-cart.png'))),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: Get.isDarkMode
                    ? const LinearGradient(
                        colors: [lightPurpleClr, midPurpleClr],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp)
                    : const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 74, 71, 96),
                          Color.fromARGB(255, 22, 23, 51)
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                selectedItemColor: Get.isDarkMode ? darkPurpleClr : greenClr,
                unselectedItemColor: Colors.white,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.home,
                          color:
                              Get.isDarkMode ? normalPurpleClr : Colors.white,
                          size: 30),
                      icon: Icon(Icons.home,
                          color: Get.isDarkMode ? Colors.white : midPurpleClr,
                          size: 30),
                      label: 'Home'),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.category,
                        color: Get.isDarkMode ? normalPurpleClr : Colors.white,
                        size: 30),
                    icon: Icon(Icons.category,
                        color: Get.isDarkMode ? Colors.white : midPurpleClr,
                        size: 30),
                    label: 'Category',
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.favorite,
                          color:
                              Get.isDarkMode ? normalPurpleClr : Colors.white,
                          size: 30),
                      icon: Icon(Icons.favorite,
                          color: Get.isDarkMode ? Colors.white : midPurpleClr,
                          size: 30),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.settings,
                          color:
                              Get.isDarkMode ? normalPurpleClr : Colors.white,
                          size: 30),
                      icon: Icon(Icons.settings,
                          color: Get.isDarkMode ? Colors.white : midPurpleClr,
                          size: 30),
                      label: 'Settings'),
                ],
                backgroundColor: Colors.transparent,
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
              ),
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        }),
      ],
    );
  }
}
