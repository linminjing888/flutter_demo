/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-10 12:25:06
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 12:44:59
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_novel_image.dart';
import 'package:flutter_demo/Group/group_novel_model.dart';
import 'package:flutter_demo/Support/mj_color.dart';
import 'package:flutter_demo/Support/mj_screen.dart';

class NovelCommendCell extends StatelessWidget {
  final Novel novel;
  NovelCommendCell(this.novel);

  @override
  Widget build(BuildContext context) {
    var width = (MJScreen.width - 15 * 4) / 3;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NovelCoverImage(
            novel.bookCover,
            width: width,
            height: width / 0.75,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            novel.bookname,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
          SizedBox(height: 3),
          Text(
            novel.authorName,
            style: TextStyle(fontSize: 12, color: MJColor.darkGray),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
