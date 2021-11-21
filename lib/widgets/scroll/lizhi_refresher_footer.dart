import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2021/common/styles/themes_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CustomFooter generateRefresherFooter() {
  return CustomFooter(
    builder: (BuildContext context, LoadStatus? mode) {
      Widget body;
      if (mode == LoadStatus.noMore) {
        body = Text(
          '— 这里是底部 —',
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.3),
          ),
        );
      } else if (mode == LoadStatus.loading) {
        body = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: ThemesColors.primary.withOpacity(.2),
                valueColor: const AlwaysStoppedAnimation<Color>(ThemesColors.primary),
                strokeWidth: 3,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '加载中...',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.3),
              ),
            ),
          ],
        );
      } else {
        body = const SizedBox.shrink();
      }
      return Container(
        height: 40.0,
        margin: const EdgeInsets.only(top: 20, bottom: 52),
        child: Center(child: body),
      );
    },
  );
}
