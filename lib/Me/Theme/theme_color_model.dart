/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 10:42:49
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 11:23:12
 * @Descripttion: 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Provider 1.创建需要共享的数据
class ThemeColorModel with ChangeNotifier, DiagnosticableTreeMixin {
  MaterialColor _color = Colors.blue;

  MaterialColor get color => _color;

  void changeColor(MaterialColor value) {
    _color = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color));
  }
}
