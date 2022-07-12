import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/space.dart';
import 'package:flutter_boilerplate/common/theme.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadiusCircular,
      child: imageUrl?.isEmpty ?? true
          ? Image.asset(
              'assets/images/image-not-available.jpg',
              fit: BoxFit.cover,
              width: width,
              height: height,
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              fit: fit,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: borderRadiusCircular,
                  ),
                  child: Padding(
                    padding: paddingSmall,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => Material(
                borderRadius: borderRadiusCircular,
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/image-not-available.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
