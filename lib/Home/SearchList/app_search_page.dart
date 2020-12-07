/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-24 16:19:43
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 15:42:20
 * @Descripttion: 搜索页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/SearchList/app_search_bar.dart';
import 'package:flutter_demo/Home/SearchList/initialize_search_data.dart';
import 'package:flutter_demo/Widgets/Circle.dart';

class MJSearchPage extends StatefulWidget {
  static const String routeName = "/search";

  @override
  _MJSearchPageState createState() => _MJSearchPageState();
}

class _MJSearchPageState extends State<MJSearchPage> {
  List<String> _searchData = SearchData().searchData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true, //appBar 收缩到最小高度的时候 appBar 是否可见
      title: AppSearchBar(
        textChange: (value) {
          print(value);
          _setupSearchData(value);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Icon(Icons.settings),
        )
      ],
      // leading: Container(),
    );
  }

  void _setupSearchData(String value) {
    setState(() {
      _searchData = SearchData()
          .searchData
          .where((element) => element.contains(value))
          .toList();
    });
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return Container(
            child: InkWell(
              onTap: () => print(_searchData[index]),
              child: _buildSliverItem(index),
            ),
          );
        },
        childCount: _searchData.length,
      ),
    );
  }

  Widget _buildSliverItem(int index) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MJCircle(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
              Text(
                _searchData[index],
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
