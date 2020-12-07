/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:49:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 16:53:11
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Support/mj_color.dart';
import 'package:flutter_demo/Support/mj_screen.dart';
import 'package:flutter_demo/Support/mj_toast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MJSharePage extends StatelessWidget {
  static const String routeName = "/share";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: MJColor.blue,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("分享有礼"),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0, // 隐藏底部分割线
        ),
        body: ShareContent(),
      ),
    );
  }
}

class ShareContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shareCode(),
          SizedBox(height: 25),
          Text(
            "  1、面对面推荐好友，扫描二维码即可下载安装",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          buildQrImage(),
          SizedBox(height: 20),
          Text(
            "  2、直接分享下载地址，推荐给好友",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            height: 45,
            width: MJScreen.width - 40,
            child: RaisedButton(
                child: Text(
                  "推荐给好友",
                  style: TextStyle(fontSize: 16),
                ),
                color: MJColor.blue,
                textColor: Colors.white,
                onPressed: () {
                  MJToast.show("推荐给好友");
                }),
          )
        ],
      ),
    );
  }

  Widget buildQrImage() {
    return Center(
      child: QrImage(
        data: "扫扫看啊",
        version: QrVersions.auto,
        size: 220,
        foregroundColor: MJColor.blue,
      ),
    );
  }

  Widget shareCode() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/share_code@2x.png"),
        Image.asset("assets/images/share_invitate@2x.png"),
        Column(
          children: [
            Text(
              "专属邀请码",
              style: TextStyle(fontSize: 13, color: MJColor.darkGray),
            ),
            SizedBox(height: 10),
            Text(
              "vzKn",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
