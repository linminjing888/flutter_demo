/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 14:07:04
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Fair/fail_page.dart';
import 'package:flutter_demo/Group/group_page.dart';
import 'package:flutter_demo/Me/MeList/me_page_list.dart';
import 'package:flutter_demo/Tabbar/bottom_bar_item.dart';
import 'package:flutter_demo/Home/HomeList/home_page.dart';

// List<MJBottomBarItem> items = [
//   MJBottomBarItem("首页", "home"),
//   MJBottomBarItem("小组", "group"),
//   MJBottomBarItem("市集", "mall"),
//   MJBottomBarItem("我的", "profile"),
// ];

final List<Widget> pages = [
  MJHomePage(),
  MJGroupPage(),
  MJFairPage(),
  MJMePage(),
];
