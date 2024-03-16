import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/core/res/assets.dart';
import 'package:the_movie/core/widgets/placeholders/empty_placehoder.dart';

import '../../res/colors.dart';
import 'loading_widget.dart';

class NetworkImageWithLoading extends StatelessWidget {
  final String img;

  const NetworkImageWithLoading({
    super.key,
    required this.img,
    this.boxFit,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });
  final BoxFit? boxFit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
       imageUrl:  img,
        fit: boxFit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, loadingProgress) {
          return Container(
            color: KAppColors.hintColor,
            child: const Center(
              child: LoadingWidget(),
            ),
          );
        },
        errorWidget: (context, error, stackTrace) {
          return Container(
            color: KAppColors.hintColor,
            child: const Center(
              child: EmptyPlaceHolder(
                message: 'Error Loading Image',
                asset: KAppSvgs.error,
              ),
            ),
          );
        },
      ),
    );
  }
}
