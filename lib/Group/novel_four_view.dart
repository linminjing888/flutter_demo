/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 18:05:25
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:09:10
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_model.dart';
import 'package:flutter_demo/Group/group_novel_cell.dart';
import 'package:flutter_demo/Support/mj_color.dart';

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
      color: MJColor.paper,
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
