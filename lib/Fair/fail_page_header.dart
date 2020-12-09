/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 14:18:41
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 15:23:40
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Support/mj_screen.dart';

class FailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Container(
            height: 170,
            width: MJScreen.width,
            child: Image.asset(
              "assets/images/top_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 70 + MJScreen.topSafeHeight,
            color: Colors.white,
            child: _buildHeaderContent(context),
          ),
          Container(
            height: 10,
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage("assets/images/default_icon.png"),
        ),
        SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "帅帅帅",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text("动态、文章、帖子等", style: TextStyle(color: Colors.black45)),
          ],
        ),
        Expanded(child: Container()),
        Padding(
          padding: EdgeInsets.only(bottom: 30, right: 20),
          child: OutlineButton(
            child: Text(
              "关注",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            onPressed: () => print("关注"),
          ),
        )
      ],
    );
  }
}
