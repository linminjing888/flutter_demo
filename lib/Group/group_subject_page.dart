import 'package:flutter/material.dart';
import 'package:flutter_demo/Widgets/loading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MJGroupFailPage extends StatefulWidget {
  @override
  _MJGroupFailPageState createState() => _MJGroupFailPageState();
}

class _MJGroupFailPageState extends State<MJGroupFailPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  int _selectedRow = -1;

  // 条目总数
  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: EasyRefresh.custom(
        emptyWidget: _count == 0 ? Container() : null, // 空白占位图
        // firstRefresh: true,
        // firstRefreshWidget: Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: Center(
        //       child: SizedBox(
        //     height: 200.0,
        //     width: 200.0,
        //     child: Card(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: <Widget>[
        //           Container(
        //             width: 50.0,
        //             height: 50.0,
        //             child: SpinKitFadingCube(
        //               color: Theme.of(context).primaryColor,
        //               size: 25.0,
        //             ),
        //           ),
        //           Container(
        //             child: Text("loading"),
        //           )
        //         ],
        //       ),
        //     ),
        //   )),
        // ), //第一次刷新loading图
        firstRefresh: true,
        firstRefreshWidget: MJLoading(),
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        onRefresh: () async {
          MJLoading.show(context);
          await Future.delayed(Duration(seconds: 2), () {
            print('onRefresh');
            MJLoading.dismiss(context);
            setState(() {
              _count = 20;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text("minjing_lin"),
                  subtitle: Text("iOS、Flutter、搬砖"),
                  leading: CircleAvatar(
                    child: Text("$index"),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    setState(() {
                      _selectedRow = index;
                    });
                  },
                  selected: index == _selectedRow,
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
      // persistentFooterButtons: <Widget>[
      //   FlatButton(
      //       onPressed: () {
      //         _controller.callRefresh();
      //       },
      //       child: Text("Refresh", style: TextStyle(color: Colors.black))),
      //   FlatButton(
      //       onPressed: () {
      //         _controller.callLoad();
      //       },
      //       child: Text("Load more", style: TextStyle(color: Colors.black))),
      // ],
    );
  }
}
