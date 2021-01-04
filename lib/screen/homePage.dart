import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/languageController.dart';
import 'package:getx_test/controller/themecontroller.dart';
import 'package:getx_test/screen/homeScreen.dart';
import 'package:getx_test/controller/incrementController.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IncrementController c = Get.put(IncrementController());
    final ThemeController t = Get.find();
    final LanguageController l = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        actions: [
          IconButton(
            icon: Icon(Icons.format_color_reset),
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              t.changeTheme(Get.isDarkMode ? false : true);
            },
          ),
          InkWell(
            child: Icon(Icons.linear_scale),
            onTap: () {
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(10.0, 90.0, 0.0, 0.0),
                  items: [
                    PopupMenuItem(
                      child: Text("नेपाली"),
                      value: 'nepali',
                    ),
                    PopupMenuItem(
                      child: Text("English"),
                      value: 'english',
                    )
                  ]).then((value) {
                switch (value) {
                  case 'nepali':
                    {
                      var locale = Locale('ne', 'NP');
                      Get.updateLocale(locale);
                      l.changeLnguage(true);
                    }
                    break;
                  case 'english':
                    {
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                      l.changeLnguage(false);
                    }
                }
              });
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            child: Text(
              'move'.tr,
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () => Get.to(HomeScreen()),
          ),
          Obx(() => Text(
                '${'no_click'.tr} : ${c.count}',
                style: TextStyle(fontSize: 25),
              )),
        ],
      )),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
    );
  }
}
