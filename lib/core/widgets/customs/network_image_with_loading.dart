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
      child: Image.network(
        img,
        fit: boxFit ?? BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: LoadingWidget(
              color: KAppColors.primaryColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
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
