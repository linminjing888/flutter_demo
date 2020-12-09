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
  List<CarouselInfo> carousels;
  List<MenuInfo> menus;
  List<Novel> books;

  DataModel.fromJson(Map data) {
    carousels = [];
    data["banner"].forEach((element) {
      carousels.add(CarouselInfo.fromJson(element));
    });

    menus = [];
    data["menu"].forEach((element) {
      menus.add(MenuInfo.fromJson(element));
    });

    books = [];
    data["book"].forEach((element) {
      books.add(Novel.fromJson(element));
    });
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
