/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-10 10:49:06
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 17:46:29
 * @Descripttion: 
 */
/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:24:19
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:13:57
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/Model/group_novel_model.dart';
import 'package:flutter_demo/Group/Views/group_bander.dart';
import 'package:flutter_demo/Group/Views/group_commend_cell.dart';
import 'package:flutter_demo/Group/Views/group_menu.dart';
import 'package:flutter_demo/Group/Model/group_model.dart';
import 'package:flutter_demo/Group/Views/group_activity_cell.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJRecommendPage extends StatefulWidget {
  @override
  _MJRecommendPageState createState() => _MJRecommendPageState();
}

class _MJRecommendPageState extends State<MJRecommendPage>
    with AutomaticKeepAliveClientMixin {
  List<CarouselInfo> _carouselInfos = [];
  List<MenuInfo> _menus = [];
  List<Novel> _books = [];

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var responseJson = await Request.get(action: "books_two");

      DataModel dataModel = DataModel.fromJson(responseJson);
      // 解决 setState() called after diapose()
      // 网络请求成功前退出了页面，该 State 被从对象树卸载掉，
      // 而这时回调了网络请求的方法，方法中带有 setState 的调用，也就导致了该问题。
      if (mounted) {
        setState(() {
          this._carouselInfos = dataModel.carousels;
          this._menus = dataModel.menus;
          this._books = dataModel.books;
        });
      }
    } catch (e) {
      MJToast.show(e.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
        SliverToBoxAdapter(
          child: Column(
            children: [
              DataBander(_carouselInfos),
              DataMenu(_menus),
            ],
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverGrid.count(
            children: _books.map((e) {
              return NovelCommendCell(e);
            }).toList(),
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.55,
          ),
        )
      ],
    );
  }
}
