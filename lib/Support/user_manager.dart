/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 17:11:40
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 18:09:48
 * @Descripttion: 
 */
import 'dart:convert';

import 'package:flutter_demo/Support/event_bus.dart';
import 'package:flutter_demo/global.dart';

const String EventUserLogin = 'EventUserLogin';
const String EventUserLogout = 'EventUserLogout';

class UserManager {
  static UserManager _instance;
  static UserManager get instance {
    if (_instance == null) {
      _instance = UserManager();
      _instance.loadUserFormLocal();
    }
    return _instance;
  }

  User user;
  static User get currentUser {
    return UserManager.instance.user;
  }

  login(Map<String, dynamic> userJson) {
    var user = User.fromJson(userJson);
    this.user = user;
    saveUser();
    eventBus.emit(EventUserLogin);
  }

  void saveUser() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = json.encode(user);
    preferences.setString("user", data);
  }

  logout() {
    this.user = null;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("user");
    eventBus.emit(EventUserLogout);
  }

  bool get isLogin {
    return user != null;
  }

  loadUserFormLocal() {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJson = preferences.getString("user");
    if (userJson != null) {
      user = User.fromJson(json.decode(userJson));
    }
  }
}

class User {
  String token;
  int id;
  String nickname;
  String avatarUrl;
  bool isVip;
  double wealth;
  int coupon;
  int monthlyTicket;

  User.fromJson(Map json) {
    token = json["token"];
    id = json["id"];
    nickname = json["nickname"];
    avatarUrl = json['avatar'];
    isVip = json['is_vip'] == 1;
    wealth = json['wealth'];
    coupon = json['coupon'];
    monthlyTicket = json['ticket'];
  }

  // 不加toJson方法，实体类对象解析成json字符串会报错
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'nickname': nickname,
      'avatar': avatarUrl,
      'is_vip': isVip ? 1 : 0,
      'wealth': wealth,
      'coupon': coupon,
      'ticket': monthlyTicket,
    };
  }
}
