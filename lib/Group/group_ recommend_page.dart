/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-10 10:49:06
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 12:44:28
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
import 'package:flutter_demo/Group/group_bander.dart';
import 'package:flutter_demo/Group/group_commend_cell.dart';
import 'package:flutter_demo/Group/group_menu.dart';
import 'package:flutter_demo/Group/group_model.dart';
import 'package:flutter_demo/Group/group_activity_cell.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJRecommendPage extends StatefulWidget {
  @override
  _MJRecommendPageState createState() => _MJRecommendPageState();
}

class _MJRecommendPageState extends State<MJRecommendPage> {
  DataModel dataModel;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var responseJson = await Request.get(action: "books_two");

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

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverGrid.count(
            children: dataModel.books.map((e) {
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
