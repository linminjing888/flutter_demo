/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:24:19
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 11:37:57
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_bander.dart';
import 'package:flutter_demo/Group/group_menu.dart';
import 'package:flutter_demo/Group/group_model.dart';
import 'package:flutter_demo/Group/group_activity_cell.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJActivityPage extends StatefulWidget {
  @override
  _MJActivityPageState createState() => _MJActivityPageState();
}

class _MJActivityPageState extends State<MJActivityPage> {
  DataModel dataModel;

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
        this.dataModel = dataModel;
      });
    } catch (e) {
      MJToast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
        SliverToBoxAdapter(
          child: Column(
            children: [
              DataBander(dataModel.carousels),
              DataMenu(dataModel.menus),
            ],
          ),
        ),
        // SliverList 高度自动, SliverFixedExtentList 高度固定死.
        SliverFixedExtentList(
          itemExtent: 125,
          delegate: SliverChildBuilderDelegate(
            (context, int index) {
              return NovelActivityCell(dataModel.books[index]);
            },
            childCount: dataModel.books.length,
          ),
        ),
      ],
    );
  }
}
