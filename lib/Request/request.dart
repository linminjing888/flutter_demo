/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 17:19:17
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 17:28:39
 * @Descripttion: 
 */
import 'dart:convert';

import 'package:flutter/services.dart';

class Request {
  static Future<dynamic> get({String action, Map params}) async {
    return Request.mock(action: action, params: params);
  }

  static Future<dynamic> post({String action, Map params}) async {
    return Request.mock(action: action, params: params);
  }

  static Future<dynamic> mock({String action, Map params}) async {
    var responseStr = await rootBundle.loadString("mock/$action.json");
    var responseJson = json.decode(responseStr);
    return responseJson["data"];
  }
}
