import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Fair/fail_page.dart';
import 'package:flutter_demo/Widgets/Circle.dart';
import 'package:flutter_demo/Widgets/dashed_line.dart';
import 'package:flutter_demo/Home/HomeList/home_model.dart';
import 'package:flutter_demo/Widgets/star_rating.dart';

class MovieWidget extends StatelessWidget {
  final MovieItem movie;
  final Color themeColor;
  MovieWidget(this.movie, this.themeColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("${movie.rank}");
        Navigator.of(context).pushNamed(MJFairPage.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 8, color: Colors.black12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildImage(context),
            SizedBox(
              height: 6,
            ),
            _buildContent(),
            SizedBox(
              height: 6,
            ),
            _buildContentDes(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildImageLeft(),
        SizedBox(width: 8),
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              image: CachedNetworkImageProvider(movie.photos[0]),
              width: MediaQuery.of(context).size.width - 28 - 100,
              height: 150,
              fit: BoxFit.cover,
            )),
      ],
    );
  }

  Widget _buildImageLeft() {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: CachedNetworkImageProvider(movie.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        MJCircle(
          radius: 10,
          color: themeColor,
          child: Text(
            "${movie.rank}",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      child: Row(
        children: <Widget>[
          _buildContentInfo(),
          SizedBox(
            width: 8,
          ),
          _buildDashedLine(),
          SizedBox(
            width: 8,
          ),
          _buildContentLove(),
        ],
      ),
    );
  }

  Widget _buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildContentTitle(),
          SizedBox(
            height: 6,
          ),
          _buildContentRating(),
          SizedBox(
            height: 6,
          ),
          Text("${movie.subTitle}"),
        ],
      ),
    );
  }

  Widget _buildContentTitle() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: themeColor,
          size: 22,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${movie.title}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildContentRating() {
    return Container(
      width: 100,
      child: MJStarRating(
        rating: double.parse(movie.rating),
        size: 20,
        selectedColor: themeColor,
      ),
    );
  }

  Widget _buildDashedLine() {
    return Container(
      height: 80,
      child: MJDashedLine(
        lineAxis: Axis.vertical,
        lineWidth: 1,
        lineHeight: 3,
      ),
    );
  }

  Widget _buildContentLove() {
    return GestureDetector(
      onTap: () => print("love"),
      child: Container(
        // height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/wish.png",
              width: 30,
              color: themeColor,
            ),
            Text(
              "想看",
              style: TextStyle(color: themeColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContentDes() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(3)),
        child: Text(
          "${movie.des}",
          style: TextStyle(color: Color(0xff666666)),
        ));
  }
}
