/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:28:23
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 14:41:16
 * @Descripttion: 
 */

import 'package:flutter_demo/Group/Model/group_novel_model.dart';

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

class DataModel {
  List<CarouselInfo> carousels;
  List<MenuInfo> menus;
  List<Novel> books;

  DataModel({this.carousels, this.menus, this.books});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      carousels = new List<CarouselInfo>();
      json['banner'].forEach((v) {
        carousels.add(new CarouselInfo.fromJson(v));
      });
    }
    if (json['menu'] != null) {
      menus = new List<MenuInfo>();
      json['menu'].forEach((v) {
        menus.add(new MenuInfo.fromJson(v));
      });
    }
    if (json['book'] != null) {
      books = new List<Novel>();
      json['book'].forEach((v) {
        books.add(new Novel.fromJson(v));
      });
    }
  }
}
