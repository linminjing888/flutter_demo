/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:49:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:49:51
 * @Descripttion: 
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Support/user_manager.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJMeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = UserManager.currentUser;

    return GestureDetector(
      onTap: () {
        if (UserManager.instance.isLogin) {
          print("已经登录");
        } else {
          Navigator.pushNamed(context, "/login"); // 路由
          // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          //   return MJLoginPage();
          // }));
        }
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(20),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: user?.avatarUrl != null
                  ? CachedNetworkImageProvider(user.avatarUrl)
                  : AssetImage("assets/images/default_icon.png"),
            ),
            // Image.asset(
            //   "images/default_icon.png",
            //   width: 80,
            // ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user != null ? user.nickname : S.of(context).login,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(S.of(context).des, style: TextStyle(color: Colors.white)),
              ],
            ),
            Expanded(child: Container()),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
