/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:49:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 16:44:05
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class MJMeContentItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  MJMeContentItem(
      {@required this.icon,
      @required this.title,
      this.subTitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: <Widget>[
            buildContentInfo(context),
            Container(
              height: 1,
              color: Color(0xFFEEEEEE),
              margin: EdgeInsets.only(left: 50),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContentInfo(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            width: 25,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(child: Container()),
          Text(subTitle),
          SizedBox(width: 5),
          Icon(
            Icons.keyboard_arrow_right,
            color: Theme.of(context).primaryColor,
          ),
          // Image.asset(
          //   "assets/images/me_arrow.png",
          //   width: 10,
          //   color: Theme.of(context).primaryColor,
          // ),
        ],
      ),
    );
  }
}
