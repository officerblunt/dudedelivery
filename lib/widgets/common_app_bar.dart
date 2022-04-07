import 'package:flutter/material.dart';
import '../constants.dart';
import 'notification_widget.dart';

class CommonAppBar extends StatelessWidget {
  final labeltext;
  final aheight;
  final Color? icolor;

  const CommonAppBar({
    Key? key,
    this.maxSize,
    this.labeltext,
    this.aheight,
    this.icolor,
  }) : super(key: key);

  final Size? maxSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: maxSize!.width,
        height: maxSize!.height * aheight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: icolor)),
            Text(
              labeltext,
              style: kMainHeading.copyWith(color: icolor, fontSize: 19),
            ),
            NotificationWidget(
              icolor: icolor,
            ),
          ],
        ),
      ),
    );
  }
}
