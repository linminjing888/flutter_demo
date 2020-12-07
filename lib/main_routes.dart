/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:01:24
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 15:19:19
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/SearchList/app_search_page.dart';

import 'Home/HomeList/home_page.dart';
import 'Tabbar/main_screen_page.dart';

class MainRouter {
  static final Map<String, WidgetBuilder> routes = {
    MainScreenPage.routeName: (ctx) => MainScreenPage(),
    MJHomePage.routeName: (ctx) => MJHomePage(),
    MJSearchPage.routeName: (ctx) => MJSearchPage(),
  };

  static final String initialRoute = MainScreenPage.routeName;
}
