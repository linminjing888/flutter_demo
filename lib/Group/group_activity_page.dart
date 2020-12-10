/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:24:19
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 17:46:18
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/Model/group_novel_model.dart';
import 'package:flutter_demo/Group/Views/group_bander.dart';
import 'package:flutter_demo/Group/Views/group_menu.dart';
import 'package:flutter_demo/Group/Model/group_model.dart';
import 'package:flutter_demo/Group/Views/group_activity_cell.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJActivityPage extends StatefulWidget {
  @override
  _MJActivityPageState createState() => _MJActivityPageState();
}

class _MJActivityPageState extends State<MJActivityPage>
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
      var responseJson = await Request.get(action: "books_one");

      DataModel dataModel = DataModel.fromJson(responseJson);

      setState(() {
        this._carouselInfos = dataModel.carousels;
        this._menus = dataModel.menus;
        this._books = dataModel.books;
      });
    } catch (e) {
      MJToast.show(e.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
        // SliverList 高度自动, SliverFixedExtentList 高度固定死.
        SliverFixedExtentList(
          itemExtent: 125,
          delegate: SliverChildBuilderDelegate(
            (context, int index) {
              return NovelActivityCell(_books[index]);
            },
            childCount: _books.length,
          ),
        ),
      ],
    );
  }
}
