/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 15:37:14
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Me/Theme/cons.dart';
import 'package:flutter_demo/Me/Theme/theme_color_model.dart';
import 'package:flutter_demo/Tabbar/bottom_bar_item.dart';
import 'package:flutter_demo/Tabbar/initialize_items.dart';
import 'package:flutter_demo/global.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _currentIndex = 0;
  bool isFinishSetup = false;

  @override
  void initState() {
    super.initState();

    setupApp();
  }

  // 全局变量 把SharedPreferences异步变为同步
  setupApp() async {
    preferences = await SharedPreferences.getInstance();

    int themeIndex = preferences.getInt(Cons.themeIndexKey) ?? 4;
    MaterialColor color = Cons.themeColors.keys.toList()[themeIndex];
    Provider.of<ThemeColorModel>(context, listen: false).changeColor(color);

    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: items(context),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }

  List<MJBottomBarItem> items(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;
    return [
      MJBottomBarItem("首页", "home", themeColor),
      MJBottomBarItem("小组", "group", themeColor),
      MJBottomBarItem("市集", "mall", themeColor),
      MJBottomBarItem("我的", "profile", themeColor),
    ];
  }
}
