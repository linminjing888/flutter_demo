/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 18:05:25
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:09:10
 * @Descripttion: 
 */
import 'package:MiaoZhangFlutter/App/mj_color.dart';
import 'package:MiaoZhangFlutter/Data/Views/data_book_cell.dart';
import 'package:MiaoZhangFlutter/Data/Views/data_book_section_view.dart';
import 'package:MiaoZhangFlutter/Data/Model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_model.dart';

class NovelNormalView extends StatelessWidget {
  final DataModel cardInfo;
  NovelNormalView(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;

    List<Widget> children = [];
    novels.forEach((element) {
      children.add(NovelBookCell(element));
    });
    children.add(Container(
      height: 10,
      color: Color(0xFFF5F5F5),
    ));

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
