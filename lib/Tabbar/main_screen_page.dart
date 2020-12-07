/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 18:14:53
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Tabbar/initialize_items.dart';
import 'package:flutter_demo/global.dart';
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
        items: items,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
