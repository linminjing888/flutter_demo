/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 15:49:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 15:58:45
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Me/MeList/initialize_me_data.dart';
import 'package:flutter_demo/Me/MeList/me_content_item.dart';
import 'package:flutter_demo/Me/MeList/me_header.dart';
import 'package:flutter_demo/Me/Theme/theme_color_setting.dart';
import 'package:flutter_demo/Me/share_page.dart';
import 'package:flutter_demo/Me/web_page.dart';
import 'package:flutter_demo/Support/event_bus.dart';
import 'package:flutter_demo/Support/mj_toast.dart';
import 'package:flutter_demo/Support/user_manager.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJContentList extends StatefulWidget {
  @override
  _MJContentListState createState() => _MJContentListState();
}

class _MJContentListState extends State<MJContentList> {
  String subTitle = "";

  @override
  void initState() {
    super.initState();

    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });

    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    eventBus.off(EventUserLogin);
    eventBus.off(EventUserLogout);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    List<String> meTitleList = [
      S.of(context).theme_setting,
      S.of(context).share_gift,
      S.of(context).help_doc,
      S.of(context).about_us,
      S.of(context).language,
    ];

    if (UserManager.instance.isLogin) {
      setState(() {
        if (meTitleList.contains("退出登录")) {
        } else {
          meTitleList.add("退出登录");
        }
      });
    } else {
      setState(() {
        meTitleList.remove("退出登录");
      });
    }
    return Container(
      height: height - 100,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: meTitleList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return MJMeHeader();
          } else {
            if (index == 1) {
              subTitle = S.of(context).open;
            } else {
              subTitle = "";
            }
            if (index == 6) {
              return GestureDetector(
                  onTap: () {
                    UserManager.instance.logout();
                    MJToast.show("退出成功");
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "退出登录",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ));
            } else {
              final title = meTitleList[index - 1];
              return MJMeContentItem(
                icon: "assets/images/${meImgList[index - 1]}",
                title: title,
                subTitle: subTitle,
                onPressed: () {
                  didSelectedItemAction(index, title);
                },
              );
            }
          }
        },
      ),
    );
  }

  void didSelectedItemAction(int index, String title) {
    print("点击了：$index");
    if (index == 1) {
      Navigator.of(context).pushNamed(MJThemeColorPage.routeName);
    } else if (index == 2) {
      Navigator.of(context).pushNamed(MJSharePage.routeName);
    } else if (index == 3) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return MJWebPage(
            url: "https://github.com/linminjing888/flutter_demo",
            title: title,
          );
        },
      ));
    }
  }
}
