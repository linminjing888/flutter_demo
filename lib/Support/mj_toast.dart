/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:59:59
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 16:00:23
 * @Descripttion: 
 */
import 'package:fluttertoast/fluttertoast.dart';

class MJToast {
  static show(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }
}
