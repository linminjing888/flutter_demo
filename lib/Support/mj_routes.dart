/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:01:24
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 15:02:09
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/SearchList/app_search_page.dart';
import 'package:flutter_demo/splash_screen.dart';
import 'package:flutter_demo/Me/Theme/theme_color_setting.dart';
import 'package:flutter_demo/Me/login_page.dart';
import 'package:flutter_demo/Me/share_page.dart';

import '../Home/HomeList/home_page.dart';
import '../Tabbar/main_screen_page.dart';

class MJRouter {
  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (ctx) => SplashScreen(),
    MainScreenPage.routeName: (ctx) => MainScreenPage(),
    MJHomePage.routeName: (ctx) => MJHomePage(),
    MJSearchPage.routeName: (ctx) => MJSearchPage(),
    MJSharePage.routeName: (ctx) => MJSharePage(),
    MJLoginPage.routeName: (ctx) => MJLoginPage(),
    MJThemeColorPage.routeName: (ctx) => MJThemeColorPage(),
  };

  static final String initialRoute = SplashScreen.routeName;
}
