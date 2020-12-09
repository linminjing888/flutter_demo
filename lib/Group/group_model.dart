/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:28:23
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 17:28:24
 * @Descripttion: 
 */

import 'package:flutter_demo/Group/group_novel_model.dart';

class DataModel {
  String id;
  String name;
  int style;
  List content;

  List<CarouselInfo> carousels;
  List<MenuInfo> menus;
  List<Novel> books;

  DataModel.fromJson(Map data) {
    id = data["id"];
    name = data["m_s_name"];
    content = data["content"];

    if (name == "banner") {
      carousels = [];
      content.forEach((element) {
        carousels.add(CarouselInfo.fromJson(element));
      });
    }
    if (name == "menu") {
      menus = [];
      content.forEach((element) {
        menus.add(MenuInfo.fromJson(element));
      });
    }
    if (data["m_s_style"] != null) {
      style = data["m_s_style"];
      books = [];
      content.forEach((element) {
        books.add(Novel.fromJson(element));
      });
    }
  }
}

class CarouselInfo {
  String imageUrl;
  String link;
  CarouselInfo.fromJson(Map data) {
    imageUrl = data["image_url"];
    link = data["link_url"];
  }
}

class MenuInfo {
  String title;
  String icon;
  MenuInfo.fromJson(Map data) {
    title = data["toTitle"];
    icon = data["icon"];
  }
}
