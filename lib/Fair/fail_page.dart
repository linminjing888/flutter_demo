/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 16:38:39
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:39:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';

// class MJFairPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).fair),
//         automaticallyImplyLeading: false,
//       ),
//       body: Container(),
//     );
//   }
// }

class MJFairPage extends StatefulWidget {
  @override
  _MJFairPageState createState() => _MJFairPageState();
}

class _MJFairPageState extends State<MJFairPage>
    with SingleTickerProviderStateMixin {
  TabController _tabbarController;
  List<String> tabs = ["资讯", "技术"];

  @override
  void initState() {
    super.initState();

    _tabbarController =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNestedScrollView2(), //_buildNestedScrollView1(context),
    );
  }

  Widget _buildNestedScrollView2() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 230.0,
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
