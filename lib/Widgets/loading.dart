import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MJLoading extends StatelessWidget {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: MJLoading(),
        );
      },
    );
  }

  static void dismiss(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 80,
          height: 80,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(
                color: Theme.of(context).primaryColor,
                size: 46,
              )
            ],
          ),
        ),
      ),
    );
  }
}
