/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 16:38:39
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 11:38:17
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Support/mj_screen.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJFairPage extends StatefulWidget {
  static const String routeName = "/fair";

  @override
  _MJFairPageState createState() => _MJFairPageState();
}

class _MJFairPageState extends State<MJFairPage>
    with SingleTickerProviderStateMixin {
  TabController _tabbarController;
  List<String> tabs = ["资讯", "技术"];
  ScrollController _scrollController = ScrollController();
  double navAlpha = 0;

  @override
  void initState() {
    super.initState();

    _tabbarController =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      print(offset);
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 100) {
        setState(() {
          navAlpha = 1 - (100 - offset) / 100;
        });
      } else {
        if (navAlpha != 1) {
          setState(() {
            navAlpha = 1;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 注:AnnotatedRegion 改变状态栏颜色无效 要在下面的 SliverAppBar 中设置
    return Scaffold(
      body: Stack(
        children: [
          _buildNestedScrollView2(),
          _buildNavigatorBar(),
        ],
      ),
    );
  }

  Widget _buildNavigatorBar() {
    return Stack(
      children: [
        Container(
            width: 44,
            height: MJScreen.navigationBarHeight,
            padding: EdgeInsets.fromLTRB(5, MJScreen.topSafeHeight, 0, 0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {},
            )),
        Opacity(
          opacity: navAlpha,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(5, MJScreen.topSafeHeight, 0, 0),
            height: MJScreen.navigationBarHeight,
            child: Row(
              children: [
                Container(
                  width: 44,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Text(
                    S.of(context).fair,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(width: 44),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNestedScrollView2() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 230.0,
            brightness:
                navAlpha > 0.5 ? Brightness.light : Brightness.dark, //修改状态栏颜色
            pinned: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: PageView(
                children: [
                  Container(
                    child: Image.asset("assets/images/default_icon.png",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    child: Image.asset("assets/images/default_icon.png",
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                controller: _tabbarController,
                labelColor: Colors.black,
                tabs: <Widget>[
                  Tab(text: tabs[0]),
                  Tab(text: tabs[1]),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabbarController,
        children: [
          HomeListView2(title: tabs[0]),
          HomeListView2(title: tabs[1]),
        ],
      ),
    );
  }
}

// 动态创建
class HomeListView2 extends StatelessWidget {
  final String title;
  HomeListView2({this.title});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemExtent: 60, // 每一个item的高度
          itemCount: 15,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$title ${index + 1}"),
              subtitle: Text("this is a description"),
              leading: Icon(Icons.account_box),
            );
          }),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
