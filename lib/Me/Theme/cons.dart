/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 10:26:28
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:46:03
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class Cons {
  static final themeColors = <MaterialColor, String>{
    Colors.red: "红",
    Colors.orange: "橙",
    Colors.yellow: "黄",
    Colors.green: "绿",
    Colors.blue: "蓝",
    Colors.indigo: "靛",
    Colors.purple: "紫",
    Colors.pink: "粉",
    Colors.brown: "棕",
    MaterialColor(0xff2D2D2D, <int, Color>{
      50: Color(0xFF8A8A8A),
      100: Color(0xFF747474),
      200: Color(0xFF616161),
      300: Color(0xFF484848),
      400: Color(0xFF3D3D3D),
      500: Color(0xff2D2D2D),
      600: Color(0xFF252525),
      700: Color(0xFF141414),
      800: Color(0xFF050505),
      900: Color(0xff000000),
    }): "黑"
  };

  static const themeIndexKey = 'theme_color_index';
}
