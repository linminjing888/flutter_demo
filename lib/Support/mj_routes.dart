/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:01:24
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 10:57:45
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Fair/fail_page.dart';
import 'package:flutter_demo/Home/SearchList/app_search_page.dart';
import 'package:flutter_demo/Me/web_page.dart';
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
    MJFairPage.routeName: (ctx) => MJFairPage(),
  };

  static final String initialRoute = SplashScreen.routeName;

  // 路由传参（多个值时，暂未找到方法）
  // static final RouteFactory onGenerateRoute = (setting) {
  //   if (setting.name == MJWebPage.routeName) {
  //     return MaterialPageRoute(
  //       builder: (context) {
  //         return MJWebPage(setting.arguments);
  //       },
  //     );
  //   }
  //   return null;
  // };

}
