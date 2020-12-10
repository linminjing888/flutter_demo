/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 18:10:31
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:14:43
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/Views/group_novel_image.dart';
import 'package:flutter_demo/Group/Model/group_novel_model.dart';
import 'package:flutter_demo/Support/mj_color.dart';

class NovelActivityCell extends StatelessWidget {
  final Novel novel;
  NovelActivityCell(this.novel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(novel.bookname);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NovelCoverImage(
              novel.bookCover,
              width: 70,
              height: 93,
            ),
            SizedBox(
              width: 15,
            ),
            buildRightInfo(context),
          ],
        ),
      ),
    );
  }

  Widget buildRightInfo(BuildContext context) {
    Color statColor = Theme.of(context).primaryColor;
    if (novel.statName == '连载') {
      statColor = MJColor.darkGray;
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            novel.bookname,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            novel.introduction,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                novel.authorName,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              Expanded(child: Container()),
              buildTagView(novel.statName, statColor),
              SizedBox(width: 5),
              buildTagView(novel.className, MJColor.darkGray),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTagView(String title, Color color) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromARGB(99, color.red, color.green, color.blue),
            width: 0.5),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: color),
      ),
    );
  }
}
