import 'package:flutter/material.dart';

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
        loadingBuilder: (context, url, loadingProgress) {
          return const Center(
            child: LoadingWidget(
              color: KAppColors.primaryColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error_outline),
          );
        },
      ),
    );
  }
}
