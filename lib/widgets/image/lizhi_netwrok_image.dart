import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2021/common/styles/images.dart';

/// 网络图片加载缓存控件
class LizhiNetworkImage extends StatelessWidget {
  const LizhiNetworkImage({
    required this.imageUrl,
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: Colors.black.withOpacity(.08), width: 0.5),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (BuildContext context, String url) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(image: AssetImage(Images.defaultCover)),
          ),
        );
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(image: AssetImage(Images.defaultCover)),
          ),
        );
      },
    );
  }
}
