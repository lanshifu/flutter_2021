import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:svgaplayer_flutter/parser.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:svgaplayer_flutter/proto/svga.pb.dart';

class RefresherHeader extends StatefulWidget {
  const RefresherHeader({Key? key}) : super(key: key);

  @override
  _RefresherHeaderState createState() => _RefresherHeaderState();
}

class _RefresherHeaderState extends State<RefresherHeader> with SingleTickerProviderStateMixin {
  late SVGAAnimationController _controller;

  @override
  void initState() {
    _controller = SVGAAnimationController(vsync: this);
    _loadAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _loadAnimation() async {
    final MovieEntity videoItem = await SVGAParser.shared.decodeFromAssets('static/files/refresher_indicator.svga');
    _controller.videoItem = videoItem;
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        if (mode == RefreshStatus.refreshing || mode == RefreshStatus.completed) {
          _controller.repeat(reverse: true).whenComplete(() => _controller.videoItem = null);
        } else {
          _controller.reset();
        }
        return SizedBox(
          width: 96,
          height: 60,
          child: ClipRect(
            child: SVGAImage(
              _controller,
            ),
          ),
        );
      },
    );
  }
}
